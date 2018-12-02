module type Tiger_TOKENS =
  sig
    type linenum (* = int *)
    type token

    val t_type:  linenum * linenum -> token
    val t_var:  linenum * linenum -> token
    val t_function:  linenum * linenum -> token
    val t_break:  linenum * linenum -> token
    val t_of:  linenum * linenum -> token
    val t_end:  linenum * linenum -> token
    val t_in:  linenum * linenum -> token
    val t_nil:  linenum * linenum -> token
    val t_let:  linenum * linenum -> token
    val t_do:  linenum * linenum -> token
    val t_to:  linenum * linenum -> token
    val t_for:  linenum * linenum -> token
    val t_while:  linenum * linenum -> token
    val t_else:  linenum * linenum -> token
    val t_then:  linenum * linenum -> token
    val t_if:  linenum * linenum -> token
    val t_array:  linenum * linenum -> token
    val t_assign:  linenum * linenum -> token
    val t_or:  linenum * linenum -> token
    val t_and:  linenum * linenum -> token
    val t_ge:  linenum * linenum -> token
    val t_gt:  linenum * linenum -> token
    val t_le:  linenum * linenum -> token
    val t_lt:  linenum * linenum -> token
    val t_neq:  linenum * linenum -> token
    val t_eq:  linenum * linenum -> token
    val t_divide:  linenum * linenum -> token
    val t_times:  linenum * linenum -> token
    val t_minus:  linenum * linenum -> token
    val t_plus:  linenum * linenum -> token
    val t_dot:  linenum * linenum -> token
    val t_rbrace:  linenum * linenum -> token
    val t_lbrace:  linenum * linenum -> token
    val t_rbrack:  linenum * linenum -> token
    val t_lbrack:  linenum * linenum -> token
    val t_rparen:  linenum * linenum -> token
    val t_lparen:  linenum * linenum -> token
    val t_semicolon:  linenum * linenum -> token
    val t_colon:  linenum * linenum -> token
    val t_comma:  linenum * linenum -> token
    val t_string: (string) *  linenum * linenum -> token
    val t_int: (int) *  linenum * linenum -> token
    val t_id: (string) *  linenum * linenum -> token
    val t_eof:  linenum * linenum -> token
  end
