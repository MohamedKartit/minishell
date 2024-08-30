NAME = minishell
CC = cc
CFLAGS = -Wall -Wextra -Werror -g3
LIBS = -lreadline
LIBFT = includes/libft/libft.a
SRC = src/main.c \
		includes/gnl/get_next_line.c\
		includes/gnl/get_next_line_utils.c\
		src/parsing/lexer/syntax_error.c\
		src/parsing/lexer/lexer_cheker.c\
		src/parsing/lexer/lexer_cheker_utils.c\
		src/parsing/lexer/lexer_cheker_utils1.c\
		src/parsing/lexer/lexer_cheker_utils2.c\
		src/parsing/lexer/syntax_cheker.c\
		src/parsing/lexer/syntax_error_utils.c\
		src/parsing/lexer/syntax_error_utils1.c\
		src/parsing/lexer/syntax_error_utils2.c\
		src/parsing/lexer/syntax_error_utils3.c\
		src/parsing/tokenizer/tokenizer.c\
		src/parsing/tokenizer/tokenizer_utils.c\
		src/parsing/tokenizer/tokenizer_utils1.c\
		src/parsing/tokenizer/tokenizer_utils2.c\
		src/parsing/tokenizer/tokenizer_checker.c \
		src/parsing/expander/expander.c\
		src/parsing/expander/herdoc_expnader.c\
		src/parsing/expander/precised_split.c \
		src/parsing/expander/expander_checker.c \
		src/parsing/expander/expand_generator.c \
		src/parsing/expander/expand_token_len_counter.c \
		src/parsing/expander/expand_tokens.c \
		src/parsing/expander/expander_generator_utils.c \
		src/parsing/expander/herdoc_generater.c \
		src/parsing/expander/herdoc_expand_utils.c \
		src/parsing/expander/expand_token_utils1.c \
		src/parsing/expander/expand_token_utils.c \
		src/parsing/parser/parser.c\
		src/parsing/parser/parser_utils.c\
		src/parsing/parser/cmd_generator.c\
		src/parsing/parser/new_node_generator.c\
		src/parsing/parser/parser_cheker.c\
		src/parsing/parser/parser_cheker_utils.c\
		src/parsing/parser/redirection_generator.c\
		src/execution/execute.c\
		src/execution/run_cmd/builtins.c\
		src/execution/run_cmd/builtins_utils.c\
		src/execution/run_cmd/cmd_runner.c\
		src/execution/run_cmd/cmd_runner_utils1.c\
		src/execution/run_cmd/cmd_runner_utils2.c\
		src/execution/run_cmd/cmd_error_handler.c\
		src/execution/utilities/redirections.c\
		src/execution/utilities/signals.c\
		src/execution/utilities/environ.c\
		src/execution/utilities/environ_utils.c\
		src/execution/utilities/environ_utils1.c\
		src/execution/utilities/freeier.c\
		src/execution/utilities/freeier_utils.c\
		src/execution/utilities/freeier_utils1.c\
		src/execution/utilities/printer.c\
		src/execution/executer/history.c\
		src/execution/executer/pipes.c\
		src/execution/executer/exec_cases.c\
		src/execution/executer/herdoc.c\
		src/execution/executer/herdoc_utils.c\
		src/execution/builtins/ft_cd.c\
		src/execution/builtins/ft_env.c\
		src/execution/builtins/ft_pwd.c\
		src/execution/builtins/ft_exit.c\
		src/execution/builtins/ft_echo.c\
		src/execution/builtins/ft_export_utils.c\
		src/execution/builtins/ft_export.c\
		src/execution/builtins/ft_unset.c\
		src/execution/wildcards/wildcards.c\
		src/execution/wildcards/wildcards_utils.c\
		src/execution/wildcards/get_list_files.c\
		src/execution/wildcards/join_list_files.c\


OBJ = $(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ) $(LIBFT)
	@echo "Compiling Minishell project..."
	@$(CC) $(CFLAGS) -g3 $^ -o $@ $(LIBS)
	@echo "Minishell project compiled successfully ✅✅"

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

$(LIBFT):
	@echo "Compiling libft project..."
	@make -C includes/libft
	@echo "LIBFT project compiled successfully ✅✅"


clean:
	@rm -f $(OBJ)
	@make clean -C includes/libft
	@echo "Cleaning complete. All build object files removed  ✅✅"

fclean: clean
	@rm -f $(NAME)
	@make fclean -C includes/libft
	@echo "Cleaning complete. All build files removed  ✅✅"

re: fclean all

.PHONY: all clean fclean re
.SECONDARY: $(OBJ)
