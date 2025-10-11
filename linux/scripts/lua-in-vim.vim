lua << EOF
  local tbl = {1, 2, 3}
  for k, v in ipairs(tbl) do
    print(v)
  end
EOF
