# agstract.cls
`agstract.cls` is a LaTeX class file for typesetting abstract algebra
psets for Shahriari Shahriar's "Algebra 1: Groups and Rings" course.
In particular, it recreates his cover sheet in TeX. If you'd like to
use it, you have a few options:
1. If you'd like to use this to typeset _all_ of your psets, then you
   should probably install the file to your local `texmf/` folder tree
   directory what-have-you thing. Instructions
   [here](https://tex.stackexchange.com/questions/1137/where-do-i-place-my-own-sty-or-cls-files-to-make-them-available-to-all-my-te).
   Once you're in `texmf/tex/latex`, you can `git clone` the
   repository there, and everything should be hunky-dory. On my
   computer, the full path to `agstract.cls` is
   ```zsh
   /Users/forestkobayashi/Library/texmf/tex/latex/agstract/agstract.cls
   ```

2. If you'd like to just take this for a test spin and not use it
   permanently (lame), then just download `agstract.cls`, and place it
   in the same directory as whatever `.tex` file you'd like to typeset
   using it.

Then, all you'll need is a `\documentclass{agstract}` at the top of
your file, followed by something like
```latex
% Substitute your name here!
\name{Forest Kobayashi}

% Put your ordered number here
\orderedNumber{14}

% Self-explanatory.
\assignment{9f}
\duedate{3/23/2018}

% Takes (m/M)onday, (w/W)ednesday, or (f/F)riday as its argument.
% Whatever day is passed will be circled on the coversheet.
\dueday{Friday}

% To input the problems you were assigned, you can just enter them
% separated by commas.
\problems{7.3.7, 10.3.12, 10.3.14, 10.4.2, 11.1.12}

% Similarly here. Note that if you have something like `Cole K., Owen
% G.` and you don't want that to be split on the comma, you can wrap
% it in braces, like so:
\acknowledgements{{Cole K., Owen G.}, {}, {}, {}, {Groupopswiki}}

% This takes as argument either 0, 1, 2, 3, 4, 5, or 6. Argument of 0
% will place an X mark in the "on time" box, 1 in the "2 day extension
% #1", etc.
\onTime{0}

% Display the full date in the bottom left of the footer.
% Realistically, I could probably automate this (the only part that's
% not trivial is getting the date superscript right), but idk how to
% do RegEx in TeX, and in general, programming in TeX is unbearable.
\lfoot{Due Tuesday, March 27th 2018}

\begin{document}

blah blah blah

\end{document}
```

If, like me, you're too lazy to type things out manually, then you can
do the following to generate my `.tex` template for agstract psets.
1. Do something like
```bash
python3 pset_gen.py
```
or
```
$ ipython
In[1]: run pset_gen.py
```
and then just follow the instructions.

# "I have no idea how any of this works"
If you're not familiar with the structure of `.cls` files and/or
defining TeX commands, don't worry! Here is an explanation of most of
the commands I've defined/redefined in `agstract.cls`:
* `\ref` --- In LaTeX, you can put a label (e.g.,
  `\label{eq:<equation_name>}`) on things like numbered equations and
  figures, allowing you to reference the equation number later in your
  document with `\ref{eq:<equation_name>}`. This is convenient,
  because if you insert an equation above `<equation_name>`, then you
  don't have to manually renumber it in your `.tex` file when its
  number increases. I have redefined `\ref` to just put parentheses
  around the equation number you get from `\ref`, so that your
  document reads "plugging (1) into (2)", and not "plugging 1 into 2".

* `\cmark` and `\xmark`: Oftentimes, if I'm writing a proof that I've
  broken into multiple cases, I want to add a checkmark after
  completing each, to show the reader that I've finished. `\cmark`
  accomplishes that quite handily. `\xmark` is for cases when you want
  a...x mark.

* `\ph` inserts a blank character that's precisely as long as the `-`
  symbol in TeX. I use this to align entries in columns of matrices
  containing negative signs. To see what I mean, put the following
  into a `.tex` file of class `agstract`, and compare how they look:
  ```latex
  \[
    \begin{bmatrix}
      -1 & 0 & \ph 0 \\
      \ph 0 & 1 & -2 \\
      -3 & 2 & \ph 3
    \end{bmatrix}
    \quad \text{vs} \quad
    \begin{bmatrix}
      -1 & 0 & 0 \\
      0 & 1 & -2 \\
      -3 & 2 & 3
    \end{bmatrix}
  \]
  ```
  yes, it's not perfect, but it gets the job done.

* `\qed` places a qed box at the right margin of the page, to signify
  that you've finished a proof.

* The following commands are all paired delimiters that'll adjust to
  fit whatever argument you pass them, if that's what you'd like them
  to do. Essentially, that means things like set braces, parentheses,
  etc. I was tired of having to use `\left( \right)` to get
  parentheses that'd automatically scale to whatever I put inside
  them, and also thought it was a pain to find the corresponding
  `\left(` to a `\right)` whenever I decided I really wanted brackets.
  These commands solve these problems, more or less. *HOWEVER*, you
  should also note that if you know for sure you'd like `\big\{
  <content> \big\}`, then you can actually just do
  `\set[big]{<content>}`, and thanks
  to [this](https://tex.stackexchange.com/a/1744) stackexchange hero,
  it'll work! And if you'd just like normal sized braces no matter how
  large the inside argument is, then you do `\set*{<content>}`. Pretty
  amazing! Anyways, the commands themselves are
  - `\set{}` --- wraps the argument you pass it in braces, according
    to the rules above.
  - `\abs{}` --- does the same, but with vertical rules.
  - `\norm{}` --- ibid, but with double vertical rules.
  - `\pn{}` --- parens
  - `\bk{}` --- brackets
  - `\ip{}` --- for angeled brackets, e.g. for an inner product, or an
    operator.
  - `\MID` --- this one is not like the others. If you put it inside
    of something like `\set{}`, then this will make a vertical rule
    that scales to the size of the `\set{}` braces. Useful for set
    comprehension.

* I've defined three shortcuts for changing the math font face: `\mrm`
  for `\mathrm`, `\mc` for `\mathcal`, and `\mb` for `\mathbf`. Now
  that I'm writing this out, I'm thinking maybe I should change `\mrm`
  to `\mr`. Hmm.

* `\st` is for typesetting "st" (such that) in math mode without
  having to write out `\mrm{\ st\ }` every time. Note, the `\ `'s are
  there to get the spacing right.

* `\lub` for lub (least upper bound), `\glb` for glb (greatest lower
  bound), and `\lcm` for lcm (least common multiple). Surprisingly,
  LaTeX doesn't have these by default.

* `\CC, \RR, \QQ, \ZZ,` and `\NN` typeset the symbols for the Complex
  Numbers, Real Numbers, Rational Numbers, Integers, and Natural
  Numbers, respectively.

* Mod field commands
  - `\zmod{n}` will expand to `\mathbb{Z}/n\mathbb{Z}` (integers mod
    n)
  - `\zpmod{n}` will expand to `(\mathbb{Z}/n\mathbb{Z}, +)` (group of
    integers mod n with addition as the group op)
  - `\uzmod{n}` will expand to `(\mathbb{Z}/n\mathbb{Z})^\times`, the
    group of units mod n.
  - `\zmmod{n}` expands to `((\mathbb{Z}/n\mathbb{Z})^\times, \cdot)`,
    the group of units mod n with the group op being multiplication.

* `\mod` just redefines the math mode mod operator thing so that the
  spacing is less bad.

* Weird letter things: `\oo`, `\cc`, `\zz` and `\nn` are shortcuts for
  `\mathcal{O}` (for orbits), `\mathbf{C}` (for centralizers),
  `\mathbf{Z}` (for the center), and `\mathbf{N}` (for normalizers).

* `\conj{x}{P}` expands to `xPx^{-1}`, for use in conjugating groups.

* `\fix` expands to `\mathrm{fix}`, for whenever you need your fix
  fix.

* Special collections of things
  - `\orbit{x}` will expand to `\mathcal{O}_{\Omega}(x)`, the orbit of
      element x in the set Omega.
  - `\stab` takes no arguments, and just typesets a roman-face "Stab".
  - `\syl{n}` will typeset `\mathrm{Syl}_n`, for whenver you're looking
    at a sylow n-group. Note that TeX won't care, but your n really
    should be a prime.
  - `\Syl` just typesets `\mathrm{Syl}`. Sometimes I just don't feel
    like going through the effort of typing in a `{`, so I use
    underscore with this. No h8
  - `\sylp` just expands to `\mathrm{Syl}_p`, for whenever you're
    dealing with a general Sylow p-group.

* Commutative-flavored agstract objects
  - `\cl` does a roman `\mathrm{cl}`, for when you're looking at
    conjugacy classes.
  - `\ctr{G}` will expand to `\mathbf{Z}(G)`, representing the center
    of a group G.
  - `\cent{G}{x}` will expand to `\mathbf{C}_G(x)`, the centralizer of
    x in G.
  - `\centg{x}` does the same thing, except it's assumed your group is
    called G and not something else.
  - `\nliz{G}{H}` will expand to `\mathbf{N}_G(H)`, the normalizer of
    H in G.

* In addition, there are a few handy environments. `theorem`,
  `corollary`, and `lemma`. You do these like
  ```latex
  \begin{theorem}[Pythagorean Theorem]
    For a right triangle with hypotenuse $c$, and legs $a$ and $b$,
    then we have $a^2 + b^2 = c^2$.
  \end{theorem}
  ```
  which will yield something like "Theorem 1.4 (Pythagorean Theorem)",
  if this is the 4th theorem you've added to your document in
  section/problem 1. If you add a corollary sometime later (but before
  the next theorem), it will be labeled as "Corollary 1.4.1" --- the
  corollary counter (the third number in 1.4.1) resets each time you
  create a new theorem or lemma. Nifty, right?
