# Markdown to PDF converter

In its current state, this little script makes a lot of assumptions. First, it
has a bunch of dependencies:

- pandoc, see <http://johnmacfarlane.net/pandoc/>
- WeasyPrint, see <http://weasyprint.org/>, which in turns depends on a *lot* of
  stuff

It also assumes that some specific fonts are installed on your system:

- Consolas, <http://www.fontpalace.com/font-details/Consolas/>, proprietary
  (Microsoft).
- Source Sans Pro, <http://sourceforge.net/projects/sourcesans.adobe/>, open
  source.

Finally, it assumes that you're writing in english (hyphenation rules).
