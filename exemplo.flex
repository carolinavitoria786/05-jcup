/* Definição: seção para código do usuário. */

import java_cup.runtime.Symbol;

%%

/* Opções e Declarações: seção para diretivas e macros. */

// Diretivas:
%cup
%unicode
%line
%column
%class MeuScanner

// Macros:
digito = [0-9]
inteiro = {digito}+

%%

/* Regras e Ações Associadas: seção de instruções para o analisador léxico. */

{inteiro} {
    Integer numero = Integer.valueOf(yytext());
    return new Symbol(sym.INTEIRO, yyline, yycolumn, numero);
}

/* Operadores aritméticos e símbolos */
"+"       { return new Symbol(sym.MAIS); }
"-"       { return new Symbol(sym.MENOS); }
"*"       { return new Symbol(sym.MULT); }
"/"       { return new Symbol(sym.DIV); }
"%"       { return new Symbol(sym.REST); }
"^"       { return new Symbol(sym.POTEN); }
"("       { return new Symbol(sym.PARENTESQ); }
")"       { return new Symbol(sym.PARENTDIR); }
";"       { return new Symbol(sym.PTVIRG); }

/* Regras para ignorar espaços e quebras de linha */
\n        { /* Ignora nova linha. */ }
[ \t\r]+  { /* Ignora espaços. */ }

/* Regra para qualquer outro caractere não reconhecido */
. {
    System.err.println("\nCaractere inválido: " + yytext() +
                       "\nLinha: " + yyline +
                       "\nColuna: " + yycolumn + "\n");
    return null;
}