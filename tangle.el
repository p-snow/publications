(require 'org)

(remove-hook 'org-babel-pre-tangle-hook
             'save-buffer)

(let* ((org-files (directory-files "./sources" t "\\.org$"))
       (org-confirm-babel-evaluate nil)
       (org-id-locations-file nil))
  (mapc (lambda (org-file)
          (org-babel-lob-ingest org-file))
        org-files)
  (dolist (org-file org-files)
    (unless (member org-file '("README.org"))
      (with-current-buffer (find-file-noselect org-file)
        (org-babel-tangle)))))
