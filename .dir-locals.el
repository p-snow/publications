((nil . ((compile-command . "make tangle")))
 (org-mode . ((auto-save-visited-mode . nil)
              (eval . (add-hook 'after-save-hook
                                (lambda ()
                                  (let ((default-directory (project-root (project-current nil))))
                                    (my/compile-default-command)))
                                 nil t)))))
