```tex
\documentclass{article}

\usepackage[utf8]{inputtenc}
\usepackage{amsmath}
\usepackage{graphicx}

\ttile{Hello Tex!}
\author{Esteban Yepez}
\date{May 2026}

\begin{document}

\maketitle

\section{introduction}
hello world!
The euler formula: $e^{i\pi}+1=0$

\begin{itemize}

\item 1
$$e= \lim_{n\to\infty}\left(1 +\frac{1}{n}\right)^n = \lim_{n\to\infty}\frac{n}{\sqrt[n]{n!}}$$

\item 2
$$e = \sum_{n=0}^{\infty} \frac{1}{n!}$$

\item 3
$$e = 2+\frac{1}{1+\frac{1}{2+\frac{2}{3+\frac{3}{4+\frac{4}{5+\ddots}}}}}$$
\end{itemize}

\section{More formulas}

$$\int_a^bf(x)dx$$

$$\iiint f(x, y, z)dxdydz$$

$$\vec{v}=<v_1, v_2, v_3>$$

$$\vec{v}\cdot \vec{w}$$

$$\begin{bmatrix}
1 & 2 & 3\\
4 & 5 & 6 \\

\end{bmatrix}
$$

% adding images to the paper
\includegraphicx[scale=0.5]{image}


\end{document}