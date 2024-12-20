(require 'org)
(require 'ob-shell)

(defun my/org-babel-tangle-remove-single-line-break ()
  "Cull single line breaks after a period in Japanese to make a paragraph."
  (replace-regexp-in-region (rx (seq (group "。")
                                     "\n"
                                     (group (not space))))
                            "\\1\\2"
                            (point-min) (point-max)))

(defun my/delete-tmp-files ()
  "Delete files whose name start with 'tmp-'."
  (dolist (del-file (file-expand-wildcards "*/tmp-*"))
    (delete-file del-file)))

(remove-hook 'org-babel-pre-tangle-hook
             'save-buffer)
(add-hook 'org-babel-tangle-body-hook
          'my/org-babel-tangle-remove-single-line-break)

(let* ((org-files (directory-files "./sources" t "\\.org$"))
       (org-confirm-babel-evaluate nil)
       (org-id-locations-file nil)
       (output-dir (file-relative-name
                    (expand-file-name "../public/ライフハックの道具箱2024年版" ".")
                    default-directory)))
  (mapc (lambda (org-file)
          (org-babel-lob-ingest org-file))
        org-files)
  (dolist (org-file org-files)
    (unless (member org-file '("README.org"))
      (with-current-buffer (find-file-noselect org-file)
        (org-babel-tangle))))
  (my/delete-tmp-files))
