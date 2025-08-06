%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template.
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[10pt,letterpaper]{article} % Font size and paper type

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{cmap}
\usepackage{enumitem}

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements

\usepackage{fontspec}
% \setmainfont{Helvetica Neue}
\setmainfont{ebgaramond}

\usepackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  filecolor=black,
  urlcolor=black,
}

\setlist[itemize]{left=0.25em,labelsep=0.5em}

\raggedright % Prevent hyphenation when line breaks occur within a word
\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \MakeUppercase{\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
      \setlength{\leftmargin}{0em} % Margin within the section
    }
    \item[]
          }{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rWorkHistoryItem}[3]{
  \noindent\textbf{#1} · #2 \hfill #3
  \vspace{-0.25em}

  \begin{itemize}
    \setlength\itemsep{-0.25em}
}{
  \end{itemize}
  % \vspace{0.25em} % uncomment for a little more space after work history items
}

\newenvironment{rEducationItem}[3]{ % 3 input arguments - degree, institution, duration
  \noindent\textbf{#1} · #2 \hfill #3 % Bold degree name and date on the right
  \vspace{-0.25em}
}

\newenvironment{rSkillItem}[2]{ % 2 input arguments - category, items
  \noindent\textbf{#1:} #2
  \vspace{-0.25em}
}

\newenvironment{rAwardItem}[3]{ % 3 input arguments - title, description, duration
  {\bf #1} {$\cdot$ #2} \hfill #3 % Bold company name and date on the right
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\LARGE} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section
\def\nameskip{\medskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section

\def\dotrule{\hdashrule{4cm}{1pt}{1pt}}
