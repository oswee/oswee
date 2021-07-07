export interface ParsedSuite {
  testsuite: {
    '@name': string
    '@failures': number
    '@errors': number
    '@tests': number
    testcase: ParsedCase | ParsedCase[]
  }
}

export interface ParsedCase {
  '@name': string
  failure?: ParsedFailure | ParsedFailure[]
}

export interface ParsedFailure {
  '@type': string
  '@message': string
  '#text': string
}
