% ================================================================== %
%                                                                    %
%                         Requirement Things                         %
%                                                                    %
% ================================================================== %

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{agstract}[2018/2/21 v0.02 Agstract pset class]

% This class based on the standard article class
\LoadClass{article}



% ================================================================== %
%                                                                    %
%                              Packages                              %
%                                                                    %
% ================================================================== %

\usepackage[margin=1in, tmargin=1.25in]{geometry}

%% Problem and reading set lists, for top of document
\usepackage{etoolbox}

% For most of the math symbols, and nice things like align
% environment
\usepackage{amsmath, amssymb}

% For `\shortintertext{}` and other things.
\usepackage{mathtools}

% For \includegraphics
\usepackage{graphicx}

% Fancy page header
\usepackage{fancyhdr}

% For customizing the enumerate environment
\usepackage{enumitem}

% For leftbar environment (for proving lemmas, if needed)
\usepackage{framed}

% For leftbar color
\usepackage{color}

% For multi-column environment
\usepackage{multicol}

% In case you want any Cayley diagrams, etc.
\usepackage{tikz}
\usetikzlibrary{arrows} % Better arrows
\usetikzlibrary{arrows.meta}
\usetikzlibrary{calc} % Add coordinates and stuff
\usetikzlibrary{patterns} % distinguishing shapes

% ...Which you would probably place in figure environments
\usepackage{float}

% For referencing page count
\usepackage{lastpage}

% Because I've learned my lesson about manual line breaks
\usepackage{parskip}

% For checkmark and xmark when confirming / denying claims
\usepackage{pifont}

% For cancelling stuff, duh
\usepackage{cancel}

% So that the whitespace around section headers can be made less
% obnoxiously large
\usepackage{titlesec}

%% COVERSHEET PACKAGES
\usepackage{ifthen}
\usepackage{array}
\usepackage{stackengine}



% ================================================================== %
%                                                                    %
%                          Control Sequences                         %
%                                                                    %
% ================================================================== %

% ------------------------ Creature Comforts ----------------------- %

% For referencing labeled equations w/ number in parens
\let\oldref\ref
\renewcommand{\ref}[1]{(\oldref{#1})}

% For confirming or denying various statements
\newcommand{\cmark}{\text{\ding{51}}}%
\newcommand{\xmark}{\text{\ding{55}}}%

% For properly aligning things w/ neg numbers in matrix environments
\newcommand{\ph}{\phantom{-}}

% Put the qed box all the way to the right
\newcommand{\qed}{\hfill $\blacksquare$}

% ----------------------- Agstract-specific ------------------------ %

% Useful commands for paired delimiters that'll adjust to fit whatever
% argument you pass --> e.g. (<something>), [<something else>]
\newcommand{\set}[1]{\ensuremath{ \left\{ #1 \right\} }}
\newcommand{\pn}[1]{\left( #1 \right)}
\newcommand{\abs}[1]{\left| #1 \right|}
\newcommand{\bk}[1]{\left[ #1 \right]}
\newcommand{\ip}[1]{\langle #1 \rangle} % inner product
\newcommand{\lip}[1]{\left\langle #1 \right\rangle} % large ip

% Useful shortcuts for when typing is just too hard
\newcommand{\mrm}[1]{\mathrm{#1}}
\newcommand{\mc}[1]{\mathcal{#1}}
\newcommand{\mb}[1]{\mathbf{#1}}

% Commands to avoid exiting math mode
\newcommand{\st}{\mrm{\ st\ }}
\DeclareMathOperator{\lub}{\mrm{lub}}
\DeclareMathOperator{\glb}{\mrm{glb}}
\DeclareMathOperator{\lcm}{\mrm{lcm}}

% Useful shortcut commands for common fields
\newcommand{\CC}{\mathbb{C}}
\newcommand{\RR}{\mathbb{R}}
\newcommand{\QQ}{\mathbb{Q}}
\newcommand{\ZZ}{\mathbb{Z}}
\newcommand{\NN}{\mathbb{N}}

% Also for some other common fields
\newcommand{\zmod}[1]{\ZZ/ #1 \ZZ}
\newcommand{\zpmod}[1]{(\zmod{#1}, +)}
\newcommand{\uzmod}[1]{\pn{\ZZ/#1 \ZZ}^\times}
\newcommand{\zmmod}[1]{(\uzmod{#1}, \cdot)}

% The default mod command is trash for some reason
\renewcommand{\mod}[1]{\ \mrm{mod}\ #1}

% Agstract letters
\newcommand{\oo}{\mc{O}}
\newcommand{\cc}{\mb{C}}
\newcommand{\zz}{\mb{Z}}
\newcommand{\nn}{\mb{N}}

% More tangibly function-flavored agstract objects
\newcommand{\conj}[2]{#1#2#1^{-1}}
\newcommand{\fix}{\mrm{fix}}

% Agstract sets / subgroups
\newcommand{\orbit}[1]{\oo_\Omega(#1)}
\newcommand{\stab}{\mrm{Stab}}
\newcommand{\syl}[1]{\mrm{Syl}_{#1}}
\newcommand{\Syl}{\mrm{Syl}}
\newcommand{\sylp}{\mrm{Syl}_p}

% Commutative-flavored things
\newcommand{\cl}{\mrm{cl}}
\newcommand{\ctr}[1]{\zz(#1)}
\newcommand{\cent}[2]{\cc_{#1} (#2)}
\newcommand{\centg}[1]{\cc_G (#1)}
\newcommand{\nliz}[2]{\mb{N}_{#1} (#2)}

\newtheorem{theorem}{Theorem}[section]
\newtheorem{corollary}{Corollary}[theorem] % Reset counter w new thm
\newtheorem{lemma}[theorem]{Lemma} % Same counter as thm


% ================================================================== %
%                                                                    %
%                          Misc. Formattings                         %
%                                                                    %
% ================================================================== %

% Let align environments overflow page breaks
\allowdisplaybreaks

% I don't like autoindentation for new paragraphs in proofs
\setlength\parindent{0pt}

% Finally, enumerate formatting
\setenumerate[0]{label=(\alph*)}

% And shorten the vspace after section headers. How to read?
%
%                {12pt plus 4pt minus 2pt}
%
%  - 12pt is what we would like the spacing to be
%  - plus 4pt means that TeX can stretch it by at most 4pt
%  - minus 2pt means that TeX can shrink it by at most 2pt

\titlespacing\section{0pt}{
  0pt plus 1pt minus 1pt}{
  0pt plus 1pt minus 1pt}



% ================================================================== %
%                                                                    %
%                          BEGIN COVERSHEET!                         %
%                                                                    %
% ================================================================== %

%% header block command rewritten to create Shahriar Shahriari's cover
%% sheet %% written by Aaron Bagheri %% revised by Forest Kobayashi


% internal state for headerblock
\def\agstract@name{}
\def\agstract@number{}
\def\agstract@assignment{}
\def\agstract@duedate{} % Actual date that it's due
\def\agstract@dueday{} % Which day to circle
% \def\agstract@reading{}
\def\agstract@problems{}
\def\agstract@acknowledgements{}
\def\agstract@onTime{}

% Commands to set header block info
\newcommand{\name}[1]{\def\agstract@name{#1}}
\newcommand{\orderedNumber}[1]{\def\agstract@number{#1}}
\newcommand{\assignment}[1]{\def\agstract@assignment{#1}}
\newcommand{\duedate}[1]{\def\agstract@duedate{#1}}
\newcommand{\dueday}[1]{\def\agstract@dueday{#1}}
\newcommand{\reading}[1]{\def\agstract@reading{#1}}
\newcommand{\problems}[1]{\def\agstract@problems{#1}
  \forcsvlist{\saveitem}{#1}}
\newcommand{\acknowledgements}[1]{\def\agstract@acknowledgements{#1}
  \forcsvlist{\othersaveitem}{#1}}
\newcommand{\onTime}[1]{\def\agstract@onTime{#1}}

% So that we can iterate through problems to fill the coversheet table
\newcounter{problemCounter}

\def\saveitem#1{%
  \stepcounter{problemCounter}%
  \expandafter\def\csname problems\theproblemCounter\endcsname{#1}%
}

\def\getProblem#1{\csname problems#1\endcsname}


% Acknowledgments counter
\newcounter{ackCounter}

\def\othersaveitem#1{%
  \stepcounter{ackCounter}%
  \expandafter\def\csname acks\theackCounter\endcsname{#1}%
}

\def\getAck#1{\csname acks#1\endcsname}


\newcommand{\readinglist}{\noindent\large\rmfamily{Read Sections
    \agstract@reading}}
\newcommand{\problemlist}{\large\rmfamily{Homework
    \agstract@assignment\ - \agstract@problems}\\[0.1em]}

\def\circleMonday{
  \begin{tikzpicture}[remember picture,overlay]
    \draw[very thick] (7.1,11.6) ellipse (1cm and 0.5cm);
  \end{tikzpicture}
}
\def\circleWednesday{
  \begin{tikzpicture}[remember picture,overlay]
    \draw[very thick] (9.25,11.6) ellipse (1.04cm and 0.52cm);
  \end{tikzpicture}
}
\def\circleFriday{
  \begin{tikzpicture}[remember picture,overlay]
    \draw[very thick] (11.2,11.6) ellipse (1.04cm and 0.52cm);
  \end{tikzpicture}
}
\def\drawX{
  \begin{tikzpicture}
    \draw[very thick] (-.25,.25) -- (.25,-.25);
    \draw[very thick] (-.25,-.25) -- (.25,.25);
  \end{tikzpicture}
}


\newcommand{\headerblock}{%
  \thispagestyle{empty}
  \newgeometry{left=1.5in,right=1.5in,top=1.5in}

  \begin{flushright}
    \textbf{Math 171} \hspace{2.8cm} \mbox{} \\
    \textbf{Shahriari} \hspace{2.8cm} \mbox{}
  \end{flushright}

  \vspace{1.4cm}

  \begin{center}
    \begin{tabular}{m{4cm} b{5cm}}
      \textbf{Name:}
      & \textbf{\underline{\large\makebox[5cm]{\agstract@name}}} \\[1.5em]
      \vspace*{-2em} \textbf{Ordered Number:}
      & \framebox(35,28){\bf \agstract@number} \\[1em]
      \textbf{HW \#\,:}
      & \textbf{\underline{\makebox[5cm]{\raisebox{.5em}{\large
        \agstract@assignment}}}} \\[1.5em]
      \textbf{Day:}
      & \textbf{Mon.} \hspace{2.5em} \textbf{Wed.} \hspace{2.5em}
        \textbf{Fri.} \\[1.5em]
      \textbf{Date:}
      & \textbf{\underline{\large\makebox[5cm]{\agstract@duedate}}}
    \end{tabular}
  \end{center}

  \vspace{1.1cm}

  \begin{center}
    \begin{tabular}{| >{\centering\arraybackslash}m{1cm} |
      >{\centering}m{1.2cm} | >{\centering\arraybackslash}m{9cm} |}
      \hline
      \textbf{No.} & \textbf{Points} & \textbf{Acknowledgments} \\
      \hline
    \end{tabular}
    \begin{tabular}{| >{\centering\arraybackslash}b{1cm} |
      >{\centering\arraybackslash}m{1.2cm} |
      >{\centering\arraybackslash}m{9cm} |}
      \hline
      \getProblem{1} & & \raisebox{-.5em}{\getAck{1}} \\[1em]
      \hline
      \getProblem{2} & & \raisebox{-.5em}{\getAck{2}} \\[1em]
      \hline
      \getProblem{3} & & \raisebox{-.5em}{\getAck{3}} \\[1em]
      \hline
      \getProblem{4} & & \raisebox{-.5em}{\getAck{4}} \\[1em]
      \hline
      \getProblem{5} & & \raisebox{-.5em}{\getAck{5}} \\[1em]
      \hline
      \textbf{Total} & & \\[1em]
      \hline
    \end{tabular}
  \end{center}

  \bigskip

  \noindent This Homework is (check one): \\
  \begin{tabular}{lll}
    \framebox(25,20){\ifthenelse{\equal{\agstract@onTime}{0}}{\drawX}{}}
    On Time
    & \framebox(25,20){\ifthenelse{\equal{\agstract@onTime}{1}}{\drawX}{}}
      2 day extension \#1
    & \framebox(25,20){\ifthenelse{\equal{\agstract@onTime}{2}}{\drawX}{}}
      2 day extension \# 2 \\
    \framebox(25,20){\ifthenelse{\equal{\agstract@onTime}{3}}{\drawX}{}}
    2 day extension \#3
    & \framebox(25,20){\ifthenelse{\equal{\agstract@onTime}{4}}{\drawX}{}}
      2 day extension \#4
    & \framebox(25,20){\ifthenelse{\equal{\agstract@onTime}{5}}{\drawX}{}}
      Brownie Point Extension \\
    \framebox(25,20){\ifthenelse{\equal{\agstract@onTime}{6}}{\drawX}{}}
    Late & &
  \end{tabular}

  % Circle the correct day on the cover sheet!
  \ifthenelse{\equal{\agstract@dueday}{Monday}}{\circleMonday}{}
  \ifthenelse{\equal{\agstract@dueday}{monday}}{\circleMonday}{}
  \ifthenelse{\equal{\agstract@dueday}{Wednesday}}{\circleWednesday}{}
  \ifthenelse{\equal{\agstract@dueday}{wednesday}}{\circleWednesday}{}
  \ifthenelse{\equal{\agstract@dueday}{Friday}}{\circleFriday}{}
  \ifthenelse{\equal{\agstract@dueday}{friday}}{\circleFriday}{}
  \restoregeometry
}

% put id header block at start of document
\AtBeginDocument{\headerblock}
\AtBeginDocument{% insert empty page
  \null
  \thispagestyle{empty}
  \addtocounter{page}{-2}
  \newpage
}

\pagestyle{fancy}
\fancyhf{}
\lhead{\agstract@name}
\chead{Homework \#\agstract@assignment}
\rhead{Math 171 - Spring \the\year}
\rfoot{\thepage\ of \pageref{LastPage}}
