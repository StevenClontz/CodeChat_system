********************************
The IntelliJ IDE CodeChat plugin
********************************
TODO: Update most of this text, which was copied from the VSCode docs.

This extension provides CodeChat's capabilities within the IntelliJ family of IDEs, as illustrated in `the CodeChat System for IntelliJ <README>` page.


Installation
============
First, install `Visual Studio Code <https://code.visualstudio.com/>`_ then install the `CodeChat extension for Visual Studio code <https://marketplace.visualstudio.com/items?itemName=CodeChat.codechat>`_. Next:

#.  `Install the CodeChat Server <../../CodeChat_Server/contents>`, which performs all the back-end work and is required for the extension to work.
#.  (Recommended) `switch to a light theme <https://code.visualstudio.com/docs/getstarted/themes>`_, since the CodeChat System only provides a light theme.


.. _use CodeChat:

Use
===
#.  Open a file that CodeChat can render (`most source files <https://codechat.readthedocs.io/en/master/CodeChat/CommentDelimiterInfo.py.html#supported-languages>`_, along with ``.rst``, ``.md``, and ``.html`` files).
#.  Open the `Visual Studio Code command palette <https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette>`_ by pressing ``Ctrl+Shift+P``. Type ``CodeChat``, then press enter to run the extension. After a moment, the rendered file should load. If it doesn't:

    #.  Determine the location of the ``CodeChat_Server`` by entering ``which CodeChat_Server`` (Linux/OS X) or ``where CodeChat_Server`` (Windows) at the terminal/command line.
    #.  Open the Visual Studio Code settings for CodeChat by navigating to ``File`` > ``Preferences`` > ``Settings`` then typing ``CodeChat`` in the search box. Enter this path for the ``Code Chat.Code Chat Server: Command``. **Important**: in Windows, replace ``\`` in the location you determined with either ``\\`` or ``/``.
    #.  Run the extension again (``Ctrl+Shift+P`` then select CodeChat).

At any time, run the CodeChat extension again (``Ctrl+Shift+P``, then ``CodeChat``) to show the CodeChat panel, re-start the CodeChat Server if it's not running, then reconnect with the server. Close the CodeChat panel then run the extension for a more complete reset.

See the `CodeChat tutorial <https://codechat.readthedocs.io/en/master/docs/tutorial.html>`_ for step-by-step instructions on authoring literate programming documents using Sphinx. For other documentation systems, create a `project configuration file <../../codechat_config.yaml>` then place it in the root directory of your project.



Usage tips
==========
Documentation using CodeChat often involves long lines. To wrap lines, `enable soft wrap <https://www.jetbrains.com/idea/guide/tips/enable-soft-wrap/>`_.


Developer docs
==============
See also the `developer docs <developer>`.

.. toctree::
    :hidden:

    README.md
    developer