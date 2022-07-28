import re
from typing import List


variable_def = re.compile(r'(let .*? = )')
variable_env_def = re.complie(r'(let-env .*? = )')
variable_usage = re.compile(r'(\$.+? )')


def handle_var_def(file_lines: List[str]) -> List[str]:
    # for variable definition.
    new_content_lines = []
    for line in file_lines:
        splitted = variable_def.split(line)
        for i in range(len(splitted)):
            if splitted[i].startswith("let"):
                splitted[i] = splitted[i].replace("-", "_")
        new_content_lines.append("".join(splitted))
    return new_content_lines


def handle_env_var_def(file_lines: List[str]) -> List[str]:
    # for env variable definition.
    new_content_lines = []
    for line in file_lines:
        splitted = variable_env_def.split(line)
        for i in range(len(splitted)):
            if splitted[i].startswith("let-env"):
                splitted[i] = splitted[i].replace("-", "_")
                splitted[i] = splitted[i].replace("let_env", "let-env")
        new_content_lines.append("".join(splitted))
    return new_content_lines

def handle_var_usage(file_lines: List[str]) -> List[str]:
    # for variable usage
    new_content_lines = []
    for line in file_lines:
        splitted = variable_usage.split(line)
        for i in range(len(splitted)):
            if splitted[i].startswith("$"):
                splitted[i] = splitted[i].replace("-", "_")
    return new_content_lines


def handle_file(f) -> List[str]:


if __name__ == "__main__":
    open("conda2.nu")
