#!/usr/bin/env nextflow

process exampleRScript {
  container 'wclose/r-base:latest'
  echo true
  
  script:
  """
  echo \$PATH
  which Rscript
  example.R
  """
  
}

process exampleBashScript {
  container 'wclose/fastqc:latest'
  echo true
  
  script:
  """
  echo \$PATH
  which fastqc
  example.sh
  """
  
}
