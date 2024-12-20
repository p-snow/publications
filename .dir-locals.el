((nil . ((compile-command . "make tangle")
         (eval . (setq output-dir
                       (or (and (boundp 'output-dir) output-dir)
                           (expand-file-name "./public/ライフハックの道具箱2024年版"))))))
 (org-mode . ((auto-save-visited-mode . nil)
              (eval . (add-hook 'after-save-hook
                                #'my/compile-default-command
                                nil t)))))
