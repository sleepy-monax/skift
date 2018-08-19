#include <string.h>
#include <stdlib.h>
#include "lib/term.h"
#include "utils.h"

term_t *term_alloc(uint width, uint height)
{
    term_t *term = MALLOC(term_t);

    term->cursor.line = 0;
    term->cursor.column = 0;

    term->width = width;
    term->height = height;

    term->screen = malloc(sizeof(termcell_t *) * height);
    for (size_t line = 0; line < height; line++)
    {
        term->screen[line] = calloc(width, sizeof(termcell_t));
    }

    return term;
}

void term_free(term_t *term)
{
    for (size_t x = 0; x < term->width; x++)
    {
        free(term->screen[x]);
    }

    free(term->screen);

    free(term);
}

void term_scroll(term_t *term)
{
    for (size_t line = 0; line < term->height - 1; line++)
    {
        memcpy(&term->screen[line], &term->screen[line + 1], sizeof(termcell_t) * term->width);
    }

    memset(term->screen[term->height - 1], 0, sizeof(termcell_t) * term->width);
}

void term_cell(term_t *term, uint line, uint column, char c, termattr_t attr, termcolor_t text, termcolor_t background)
{
    if (line < term->height)
    {
        if (column < term->width)
        {
            termcell_t *cell = &term->screen[line][column];
            cell->c = c;
            cell->attr = attr;
            cell->text = text;
            cell->background = background;
        }
    }
}

void term_print(term_t * term, const char * msg)
{
    STUB(term, msg);
}