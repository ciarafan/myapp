#!/bin/bash
set -e

echo "===================="
echo "Executing todo.py"
echo "===================="
python3 /app/.github/scripts/todo.py | tee /tmp/todo_output.txt

echo "===================="
echo "Executing todo-test.py"
echo "===================="
python3 /app/.github/scripts/todo-test.py | tee /tmp/test_output.txt

echo "===================="
echo "Executing update_index.sh"
echo "===================="
bash /app/.github/scripts/update_index.sh /tmp/todo_output.txt /tmp/test_output.txt

echo "===================="
echo "Done!"
echo "===================="
