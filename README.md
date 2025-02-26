<br />
<div align="center">
  <h3 align="center">DUAD: A Data Driven Algorithm to Find Discrete Approximations of Unknown Continuous Distributions</h3>

  <p align="center">
    A software to generate discrete distribution from continuous numeric data
    <br />
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

Discrete approximation of continuous probability distributions is applied in solving large-scale intractable stochastic decision models. While the existing approaches rely on the known continuous distribution; no technique currently exists that approximates a distribution without prior knowledge of the underlying process. Moreover, the quality of these approximations improves by refining the discretization, but with increasing computational cost. We thus propose an algorithm that finds a good approximation with minimal discretization using the asymptotic moments' convergence behavior. The results show algorithm’s robust behavior for various distribution shapes.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [[Matlab][Matlab]][Matlab-url]
<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

Download the the full code (daud_m.m  countis.m   mtit.m   sRound.m   pdf_plots.m) and place it in a single folder. Open the daud_m.m file. Place the CSV file containing the data. write the name of the file on the 4th line of the daud_m.m file where the variable name is give as 'name2'. Run the code.


### Prerequisites

Latest verion of Matlab is required

### Installation

1. Download all the .m codes
2. Update line 4 for data file name.
3. Run the code

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

The code will generate the output and save in CSV files:
1. Discrete probabilites in probabilities.csv
2. Moments in output.csv
3. Moments convergence history in moments.csv

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
### Top contributors:

Atiq Siddiqui https://scholar.google.com/citations?hl=en&user=DQKUDvoAAAAJ



<!-- LICENSE -->
## License



<!-- CONTACT -->
## Contact

Your Name - [@atique1619]([https://twitter.com/twitter_handle](https://x.com/atique1619)) - a_siddiqui@yu.edu.sa


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
[Matlab]: [https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white](https://matlab.mathworks.com/)
