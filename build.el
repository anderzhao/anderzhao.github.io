(require 'ox-publish)

(use-package package
  :config
  (add-to-list 'package-archives '("melpa"        . "https://melpa.org/packages/"))
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
  (add-to-list 'package-archives '("org"          . "https://orgmode.org/elpa/"))
  :unless (bound-and-true-p package--initialized)
  (package-initialize))

(use-package htmlize :ensure t)

(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\"
      href=\"https://cdn.simplecss.org/simple.min.css\" />")

(setq org-publish-project-alist
      '(("blog-page"
	 :base-directory "org/"
	 :base-extension "org"
	 :publishing-directory "public_html/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :org-html-preamble nil
	 )
	("blog-post"
	 :base-directory "org/post/"
	 :base-extension "org"
	 :publishing-directory "public_html/post/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :org-html-preamble nil
	 :with-author nil
	 :with-creator t
	 :with-toc t
	 :section-numbers nil
	 :time-stamp-file nil
	 )
	("blog-static"
	 :base-directory "org/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "public_html/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("blog"
	 :components ("blog-page" "blog-post" "blog-static"))))

(org-publish-all t)

(message "Build complete!")
