import os
from datetime import datetime
import math

header = "\\documentclass{agstract}"
header += """

% ================================================================== %
%                                                                    %
%                              Document                              %
%                                                                    %
% ================================================================== %

% ----------------------- Header formatting ------------------------ %

"""

def gen(file, assignment_no, date_input, problems):
    ordinal = lambda n: "%d%s" % (n,"tsnrhtdd"[(math.floor(n/10)%10!=1)*(n%10<4)*n%10::4])

    date = datetime.strptime(date_input, '%m/%d/%Y')
    dueday = date.strftime("%A")
    month = date.strftime("%B")
    dom = ordinal(int(date.strftime("%d")))

    duedate = date.strftime('%B %d, %Y')

    plist = problems.split(",")

    out_string = header
    out_string += "\\name{Forest Kobayashi}" + "\n"
    out_string += "\\orderedNumber{14}" + "\n"
    out_string += "\\assignment{" + str(assignment_no) + "}\n"
    out_string += "\\duedate{" + date.strftime("%m/%d/%Y") + "}\n"
    out_string += "\\dueday{" + dueday + "}\n"
    out_string += "\\problems{" + problems + "}\n"
    out_string += "\\acknowledgements{}" + "\n"
    out_string += "\\onTime{0}" + "\n\n"
    out_string += "\\lfoot{Due " + dueday + ", " + month + " " + dom + " 2018" + "}" + "\n\n"

    out_string += "\\begin{document}" + "\n\n"

    for i in range(len(plist)):
        if " " == plist[i][0]:
            plist[i] = plist[i][1:]

        out_string += """% --------------------------- Problem """ + str(i+1) + """ ---------------------------- %"""
        out_string += "\n\n" + "  \\section*{Problem " + plist[i] + "}\n\n  \\hrulefill\n\n  \\section*{Solution}\n\n  \\clearpage\n\n"

    out_string += "\\end{document}"

    file.write(out_string)
    return

def main():
    main_dir = os.getcwd()
    no = input("which assignment number?")
    di = input('Enter a date(mm/dd/yyyy): ')
    ps = input("which problems were assigned?")

    directories = os.listdir()
    dir_name = "pset" + no[:-1]
    if not os.path.isdir(dir_name):
        os.mkdir(dir_name)

    os.chdir(dir_name)

    if not os.path.isdir(no[-1]):
        os.mkdir(no[-1])

    os.chdir(no[-1])
    filename = "math_171_hw" + no + ".tex"
    if os.path.isfile(filename):
        cont = input("file already exists! Are you sure? [y]/n")
        if cont == "y":
            cont = input("Are you sure? File will be overwritten. [y]/n")
            if cont == "y":
                file = open(filename, "w")
            else:
                return
        else:
            return

    else:
        file = open(filename, "w")

    gen(file, no, di, ps)

    os.chdir(main_dir)
