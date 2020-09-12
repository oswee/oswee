import { LintResult, Warning } from 'stylelint'
import { relative, join } from 'path'
import { ParsedSuite, ParsedCase } from './parsed-suite.interface'

// bazel run files helper used to resolve paths that are created with `$(location ...)`
/* eslint-disable @typescript-eslint/no-var-requires */
const { dir, workspace } = require(`${process.env.BAZEL_NODE_RUNFILES_HELPER}`)

/** Creates an object that can be used to create an XML out of the provided lint result */
export function parseSuite(testSuite: LintResult): ParsedSuite {
  const name = relative(join(dir, workspace), testSuite.source)
  const failuresCount = testSuite.warnings.length
  const testCases = testSuite.errored
    ? testSuite.warnings.map((testCase: Warning) => parseFailedCase(testCase, name))
    : { '@name': 'stylelint.passed' }

  return {
    testsuite: {
      '@name': name,
      '@failures': failuresCount,
      '@errors': failuresCount,
      '@tests': failuresCount || 1,
      testcase: testCases,
    },
  }
}

/** Creates an object for the failed rules that can be converted in an XML */
function parseFailedCase(testCase: Warning, testFile: string): ParsedCase {
  const { line, column, text, rule, severity } = testCase

  return {
    '@name': rule,
    failure: {
      '@type': severity,
      '@message': text,
      '#text': `On line ${line}, column ${column} in ${testFile}`,
    },
  }
}
