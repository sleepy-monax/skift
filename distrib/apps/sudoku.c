#include <unistd.h>

int sudoku_solvable(char sudoku[9][9])
{
	int count = 0;
	int line = 0;
	while (line < 9)
	{
		int column = 0;

		while (column < 9)
		{
			if (sudoku[line][column])
			{
				char v = sudoku[line][column];

				sudoku[line][column] = 0;
				if (!sudoku_check(sudoku, line, column, v))
				{
					sudoku[line][column] = v;
					return 0;
				}
				sudoku[line][column] = v;

				count++;
			}
			++column;
		}
		++line;
	}

	return (count >= 17 ? 1 : 0);
}

int sudoku_parse(char sudoku[9][9], char **argv)
{
	int line = 0;
	while (line < 9)
	{
		int column = 0;

		while (column < 9)
		{
			char c = argv[line][column];
			char *cell = &sudoku[line][column];

			if (c > '0' && c <= '9')
				*cell = c - '0';
			else if (c == '.')
				*cell = 0;
			else
				return 0;

			++column;
		}
		++line;
	}

	return 1;
}

void sudoku_display(char sudoku[9][9])
{
	int line = 0;
	while (line < 9)
	{
		int column = 0;
		while (column < 9)
		{
			int value = sudoku[line][column] + '0';
			write(1, &value, 1);
			if (column + 1 < 9)
				write(1, " ", 1);
			++column;
		}
		write(1, "\n", 1);
		++line;
	}
}

int sudoku_check(char sudoku[9][9], int line, int column, char n)
{
	int i = 0;
	while (i < 9)
	{
		if (sudoku[i][column] == n)
			return 0;
		i++;
	}

	int j = 0;
	while (j < 9)
	{
		if (sudoku[line][j] == n)
			return 0;
		j++;
	}

	int line_start = (line / 3) * 3;
	int column_start = (column / 3) * 3;

	i = 0;
	while (i < 3)
	{
		j = 0;
		while (j < 3)
		{
			if (sudoku[i + line_start][j + column_start] == n)
				return 0;
			j++;
		}
		i++;
	}

	return 1;
}

int begin(char sudoku[9][9], int *line, int *column)
{
	*line = 0;
	while (*line < 9)
	{
		*column = 0;
		while (*column < 9)
		{
			if (sudoku[(*line)][(*column)] == 0)
				return 1;

			(*column)++;
		}
		(*line)++;
	}

	return 0;
}

int sudoku_solve(char sudoku[9][9])
{
	int line = 0;
	int column = 0;

	if (!begin(sudoku, &line, &column))
		return 1;

	int i = 1;
	while (i <= 9)
	{
		if (sudoku_check(sudoku, line, column, i))
		{
			sudoku[line][column] = i;

			if (sudoku_solve(sudoku))
				return 1;

			sudoku[line][column] = 0;
		}

		i++;
	}

	return 0;
}

int main(int argc, char **argv)
{
	char sudoku[9][9];

	if (argc == 10 &&
		sudoku_solvable(sudoku) &&
		sudoku_parse(sudoku, ++argv) &&
		sudoku_solve(sudoku))
		return 0;

	write(1, "Error\n", 7);
	return 1;
}
