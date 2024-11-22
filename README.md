# Kaleidoscope
Implementation of the Kaleidoscope language tutorial from llvm

Grammar Rules

<top> ::= <definition> 
       | <external> 
       | <expression>
       | ';'

<definition> ::= 'def' <prototype> <expression>

<external> ::= 'extern' <prototype>

<prototype> ::= <identifier> '(' <identifier>* ')'

<expression> ::= <primary> <binoprhs>

<primary> ::= <identifierexpr>
           | <numberexpr>
           | <parenexpr>

<identifierexpr> ::= <identifier>
                  | <identifier> '(' <expression>* ')'

<numberexpr> ::= <number>

<parenexpr> ::= '(' <expression> ')'

<binoprhs> ::= (<binop> <primary>)*

<binop> ::= '+' | '-' | '*' | '<'

<top>:
Represents the entry point of the language. It can handle function definitions, external declarations, expressions, or semicolons.
<definition>:
Defines a function with a prototype and a body (<expression>).
<external>:
Declares an external function prototype (e.g., for linking to built-in functions like sin or cos).
<prototype>:
Defines a function signature, including its name and argument list.
<expression>:
The core of the language, combining primary expressions and binary operations.
<primary>:
Represents the base-level constructs of the language: identifiers, numbers, or parenthesized expressions.
<identifierexpr>:
Handles identifiers, which can be variable references or function calls with arguments.
<numberexpr>:
Represents numeric literals (e.g., 1.23).
<parenexpr>:
Handles expressions enclosed in parentheses, providing grouping.
<binoprhs>:
Parses sequences of binary operators and primary expressions based on operator precedence.
<binop>:
Defines the binary operators supported in the language (+, -, *, <).

/// toplevelexpr ::= expression
static std::unique_ptr<FunctionAST> ParseTopLevelExpr() {
  if (auto E = ParseExpression()) {
    // Make an anonymous prototype (function with no name and no arguments)
    auto Proto = std::make_unique<PrototypeAST>("__anon_expr", std::vector<std::string>());
    return std::make_unique<FunctionAST>(std::move(Proto), std::move(E));
  }
  return nullptr;
}
The expression is parsed as a standard <expression>.
The parser wraps the expression in an anonymous function prototype named __anon_expr.
This prototype has no arguments (std::vector<std::string>()).
The wrapped function is then compiled and executed immediately.

def foo(x y) x + y *3;
extern sin(x);
4 + 5 * (6 - 3);

