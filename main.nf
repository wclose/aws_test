#!/usr/bin/env nextflow

process exampleRScript {
  container 'wclose/r-base:latest'
  echo true
  
  script:
  """
  example.R
  """
  
}

process exampleBashScript {
  echo true
  
  script:
  """
  example.sh
  """
  
}
