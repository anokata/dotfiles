sensors | grep Core | cut -d+ -f 2 | cut -d' ' -f 1 | tr '\n' ' '
echo Ядерная температура: `sensors | grep Core | cut -d+ -f 2 | cut -d" " -f 1 | tr "\n" " "`
