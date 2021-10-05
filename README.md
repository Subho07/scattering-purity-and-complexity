# Scattering purity and complexity

A scattering purity and complexity measure using the mean (<img src="https://latex.codecogs.com/gif.latex?m" title="m" />) and standard deviation (<img src="https://latex.codecogs.com/gif.latex?s" title="s" />) of the real positive eigenvalues of a Hermitian positive semi-definite matrix (T/ C). To obtain these expressions, certain inequalities are used on the bounds of the condition number for Hermitian positive definite matrices (T/ C) defined in terms of <img src="https://latex.codecogs.com/gif.latex?m" title="m" /> and <img src="https://latex.codecogs.com/gif.latex?s" title="s" />. The polarimetric scattering purity parameter characterizes the amount of overall polarization structure in the scattered wave. In contrast, the polarimetric scattering complexity parameter describes the mixture of orthogonal polarized pure components in the scattered wave.


## Methodology

For a <img src="https://latex.codecogs.com/gif.latex?n&space;\times&space;n" title="n \times n" /> Hermitian positive definite matrix <img src="https://latex.codecogs.com/gif.latex?\mathbf{\Phi}" title="\phi" />, the upper and lower bounds of the matrix condition number <img src="https://latex.codecogs.com/gif.latex?(\kappa(\mathbf{\Phi})&space;=&space;\lambda_{\text{max}}(\mathbf{\Phi})/\lambda_{\text{min}}(\mathbf{\Phi})\geq&space;1)" title="(\kappa(\mathbf{\Phi}) = \lambda_{\text{max}}(\mathbf{\Phi})/\lambda_{\text{min}}(\mathbf{\Phi})\geq 1)" /> is given as,

Upper bound

<img src="https://latex.codecogs.com/gif.latex?\kappa(\mathbf{\Phi})&space;\leq&space;1&space;&plus;&space;\dfrac{(2n)^{1/2}s\left[m&space;&plus;&space;s/(n&space;-&space;1)^{1/2}\right]^{n-1}}{\text{det}(\mathbf{\Phi})}" title="\kappa(\mathbf{\Phi}) \leq 1 + \dfrac{(2n)^{1/2}s\left[m + s/(n - 1)^{1/2}\right]^{n-1}}{\text{det}(\mathbf{\Phi})}" />

Lower bound

<img src="https://latex.codecogs.com/gif.latex?1&space;&plus;&space;\dfrac{2s}{m&space;-&space;s/(n&space;-&space;1)^{1/2}}&space;\leq&space;\kappa(\mathbf{\Phi}),&space;\quad&space;\text{$n$&space;is&space;even}" title="1 + \dfrac{2s}{m - s/(n - 1)^{1/2}} \leq \kappa(\mathbf{\Phi}), \quad \text{$n$ is even}" />

<img src="https://latex.codecogs.com/gif.latex?1&space;&plus;&space;\dfrac{2sn/(n^2&space;-&space;1)^{1/2}}{m&space;-&space;s/(n&space;-&space;1)^{1/2}}&space;\leq&space;\kappa(\mathbf{\Phi}),&space;\quad&space;\text{$n$&space;is&space;odd}" title="1 + \dfrac{2sn/(n^2 - 1)^{1/2}}{m - s/(n - 1)^{1/2}} \leq \kappa(\mathbf{\Phi}), \quad \text{$n$ is odd}" />

where <img src="https://latex.codecogs.com/gif.latex?\text{det}(\mathbf{\Phi})" title="\text{det}(\mathbf{\Phi})" /> is the determinant of <img src="https://latex.codecogs.com/gif.latex?\mathbf{\Phi}" title="\mathbf{\Phi}" />. 

An equivalent definition of matrix condition number is given as, <img src="https://latex.codecogs.com/gif.latex?\kappa(\mathbf{\Phi})&space;=&space;\|\mathbf{\Phi}\|\|\mathbf{\Phi}^{-1}\|" title="\kappa(\mathbf{\Phi}) = \|\mathbf{\Phi}\|\|\mathbf{\Phi}^{-1}\|" />, where <img src="https://latex.codecogs.com/gif.latex?\|\mathbf{\Phi}\|&space;=&space;\max(\|\mathbf{\Phi}\mathbf{x}\|/\|\mathbf{x}\|)" title="\|\mathbf{\Phi}\| = \max(\|\mathbf{\Phi}\mathbf{x}\|/\|\mathbf{x}\|)" /> represents the Euclidean norm, and <img src="https://latex.codecogs.com/gif.latex?\mathbf{x}" title="\mathbf{x}" /> is a vector. If a matrix is singular, then its condition number is infinite. A finite large condition number indicates that the matrix is close to being singular. 

We define two auxiliary descriptors, <img src="https://latex.codecogs.com/gif.latex?0&space;\le&space;P_{U}&space;\le&space;1" title="0 \le P_{U} \le 1" /> and <img src="https://latex.codecogs.com/gif.latex?0&space;\le&space;P_{L}&space;\le&space;1" title="0 \le P_{L} \le 1" /> quantifying minimum and maximum polarization measures as,

<img src="https://latex.codecogs.com/gif.latex?P_{U}&space;=&space;\frac{\kappa_{U}(\mathbf{\Phi})&space;-&space;1}&space;{\kappa_{U}(\mathbf{\Phi})&space;&plus;&space;1}" title="P_{U} = \frac{\kappa_{U}(\mathbf{\Phi}) - 1} {\kappa_{U}(\mathbf{\Phi}) + 1}" />

<img src="https://latex.codecogs.com/gif.latex?P_{L}&space;=&space;\frac{\kappa_{L}(\mathbf{\Phi})&space;-&space;1}{\kappa_{L}(\mathbf{\Phi})&space;&plus;&space;1}" title="P_{L} = \frac{\kappa_{L}(\mathbf{\Phi}) - 1}{\kappa_{L}(\mathbf{\Phi}) + 1}" />

where <img src="https://latex.codecogs.com/gif.latex?\kappa_{U}(\mathbf{\Phi})" title="\kappa_{U}(\mathbf{\Phi})" /> and <img src="https://latex.codecogs.com/gif.latex?\kappa_{L}(\mathbf{\Phi})" title="\kappa_{L}(\mathbf{\Phi})" /> indicate equality in the upper and lower bounds (for n is either even or odd) for the condition number of <img src="https://latex.codecogs.com/gif.latex?\mathbf{\Phi}" title="\mathbf{\Phi}" /> respectively







