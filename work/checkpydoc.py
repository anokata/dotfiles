#!/usr/bin/env python2
# -*- coding: utf-8 -*-
import ast
import unidiff
import sys

def read_file(filename):
    try:
        with open(filename, 'r') as fin:
            return fin.read()
    except:
        return ""


def line_num_for_phrase_in_file(phrase, filename):
    with open(filename,'r') as f:
        for (i, line) in enumerate(f):
            if phrase in line:
                return i + 1
    return -1

def get_ast_tree(filename):
    """ Build AST tree for whole file """
    try:
        with open(filename) as fin:
            code_text = fin.read()
    except:
        print("Error reading input file")
        exit()
    tree = ast.parse(code_text)

    #for node in ast.walk(tree):
        #for child in ast.iter_child_nodes(node):
            #child.parent = node

    return tree

class FindFunc(ast.NodeVisitor):
    """ visitor ast tree """

    last_func = None
    in_func = False
    f_start = None
    doc = None
    lines = None
    line = None
    errors = None

    def __init__(self, lines, filename):
        self.lines = lines
        self.lines = list(set(self.lines))
        self.lines.sort()
        self.lines.reverse()
        #print(self.lines)
        self.line = self.lines.pop()
        self.errors = list()
        self.filename = filename

    def visit(self, node):
        """ visitor method """
        if isinstance(node, ast.FunctionDef):
            self.last_func = node
        if isinstance(node, ast.ClassDef):
            self.last_func = None

        l = getattr(node, 'lineno', None)
        last_func_start = getattr(self.last_func, 'lineno', None)
        ast.NodeVisitor.visit(self, node)
        if last_func_start and l == self.line and not self.in_func and not isinstance(node, ast.ClassDef):
            self.in_func = True
            self.f_start = self.last_func.lineno
            self.doc = ast.get_docstring(self.last_func)
            if not self.doc:
                self.errors.append("{}:{}: Missing docstring for function {}".format(
                        self.filename, self.last_func.lineno, self.last_func.name))

        if l >= self.line:
            if len(self.lines) > 0:
                self.line = self.lines.pop()
            else:
                self.line = -1

        if l and self.in_func and l > self.line and isinstance(node, ast.FunctionDef):
            self.in_func = False


def cut_lines(text, start, end):
    acc = ""
    for (i, line) in enumerate(text.split("\n")):
        if i + 1 >= start and i < end:
            acc = "\n".join([acc, line])
    return acc


class FindClass(ast.NodeVisitor):
    """ visitor ast tree """

    last_func = None
    in_func = False
    last_cls = None
    line_cls = None
    in_cls  = False
    f_start = None
    doc = None
    lines = None
    error = ""
    line = None

    def __init__(self, lines, filename):
        self.lines = lines
        self.lines = list(set(self.lines))
        self.lines.sort()
        self.lines.reverse()
        self.errors = list()
        self.line = self.lines.pop()
        self.filename = filename

    def visit(self, node):
        """ visitor method """
        if isinstance(node, ast.FunctionDef):
            self.last_func = node
        if isinstance(node, ast.ClassDef):
            self.last_cls = node
        if self.last_func and self.last_func.col_offset == 0:
            self.last_cls = None

        l = getattr(node, 'lineno', None)
        last_class_start = getattr(self.last_cls, 'lineno', None)
        ast.NodeVisitor.visit(self, node)
        if last_class_start and l and l == self.line and not self.in_cls:
            self.in_cls  = True
            self.f_start = self.last_cls.lineno
            self.line_cls = node

            self.doc = ast.get_docstring(self.last_cls)
            if not self.doc and self.last_cls.name != "Meta":
                self.errors.append("{}:{}: Missing docstring for class {}".format(
                        self.filename, self.last_cls.lineno, self.last_cls.name))

        if l >= self.line:
            if len(self.lines) > 0:
                self.line = self.lines.pop()
            else:
                self.line = -1

        if l and self.in_cls  and l > self.line and self.last_cls != self.line_cls:
            self.in_cls  = False


def check_doc_in_fun(filename, lines):
    """ check docstring presens in function by line sample """
    file_content = read_file(filename)
    if not file_content:
        return []
    tree = get_ast_tree(filename)
    finder = FindFunc(lines, filename)
    finder.visit(tree)
    return finder.errors

def check_doc_in_class(filename, lines):
    """ check docstring """
    file_content = read_file(filename)
    if not file_content:
        return []
    tree = get_ast_tree(filename)
    finder = FindClass(lines, filename)
    finder.visit(tree)
    return finder.errors


def check_file_lines(filename, lines):
    error_list = []
    error_list.extend(check_doc_in_fun(filename, lines))
    error_list.extend(check_doc_in_class(filename, lines))
    return error_list

def process_diff(content):
    """ test """
    error_list = []
    git_root = sys.argv[1]

    # extract line numbers
    patch = unidiff.PatchSet.from_string(content, encoding='utf-8')
    for file in patch:
        lines = []
        if not file.path.endswith(".py"):
            continue
        for hunk in file:
            #lines.append(hunk.target_start)
            for line in hunk:
                if line.target_line_no:
                    lines.append(line.target_line_no)
                    #lines.extend(range(line.source_line_no + 1, line.source_line_no + 1 + lines_count))

        if lines:
            error_list.extend(check_file_lines(git_root + '/' + file.path, lines))
    for e in set(error_list):
        print(e)
    exit(len(error_list))


diff_content = sys.stdin.read()
process_diff(diff_content)
