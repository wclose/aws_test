#!/usr/bin/env nextflow

process exampleRScript {
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
