import { LintResult } from 'stylelint'
import { create } from 'xmlbuilder'
import { parseSuite } from './parse-suite'
import { ParsedSuite } from './parsed-suite.interface'

/** Junit formatter for stylelint */
export function junitFormatter(stylelintResults: LintResult[]): string {
  const parsedResults = stylelintResults.map(result => parseSuite(result))

  return createXML(parsedResults)
}

/** Creates an XML out of the provided object structure */
export function createXML(testSuites: ParsedSuite[]): string {
  const xmlRoot = create('testsuites', { encoding: 'utf-8' }).att('package', 'stylelint.rules')

  return testSuites.length > 0 ? xmlRoot.element(testSuites).end({ pretty: true }) : xmlRoot.end({ pretty: true })
}
