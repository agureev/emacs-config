(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(custom-safe-themes
   '("5642b25b6df4d6b63787cbc3d3ef07ca4cb7b0a7a00740ce8e9867c00e57632f" "00b463c48742afe509ae7d1dcfce09471f7203e13a118f1256b208017a978b4e" "e7b7d1e49adc2b0533b4fe57617c358ecbca80f39d05a30b825b998fa86bc372" default))
 '(fancy-splash-image "/home/artgur/Pictures/v")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(lispy-no-space t)
 '(package-selected-packages
   '(lsp-mode prop-menu protobuf-mode elixir-mode magit helm ac-slime company slime rust-mode auto-complete flucui-themes boron-theme proof-general forest-blue-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-variable-name-face ((t nil)))
 '(proof-locked-face ((t (:extend t :background "dark slate gray"))))
 '(proof-mouse-highlight-face ((t (:background "dim gray"))))
 '(proof-queue-face ((t (:extend t :background "slate gray")))))

(global-auto-complete-mode t)

(add-to-list 'ac-modes
'(emacs-lisp-mode lisp-mode lisp-interaction-mode
    slime-repl-mode
    nim-mode c-mode cc-mode c++-mode objc-mode swift-mode go-mode
    java-mode malabar-mode clojure-mode clojurescript-mode  scala-mode
    scheme-mode
    ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode
    perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode
    ecmascript-mode javascript-mode js-mode js-jsx-mode js2-mode js2-jsx-mode
    coffee-mode php-mode css-mode scss-mode less-css-mode
    elixir-mode
    makefile-mode sh-mode fortran-mode f90-mode ada-mode
    xml-mode sgml-mode web-mode
    ts-mode
    sclang-mode
    verilog-mode
    qml-mode
    apples-mode))

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h") 'helm-command-prefix )
(global-set-key (kbd"M-x")  'helm-M-x)
(global-set-key (kbd "C-x b")  'helm-buffers-list) 
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (("C-c h" . helm-command-prefix)
;;  ;; For locate and find. Find is for current directory while locate is for everything and
;;  ;; I've added fuzzy... to get unfuzzy results add ""
;;  ("C-z" . helm-find)
;;  ("C-x w" . helm-do-grep-ag)
;;  :map helm-map
;;  ("<tab>" . helm-execute-persistent-action) ; rebind tab to run persistent action
;;  ("C-i" . helm-execute-persistent-action) ; make TAB works in terminal
;;  ("C-z" . helm-select-action))

(define-abbrev-table 'global-abbrev-table '(
                                            ("inv" "⁻¹")
                                            ("inf" "∞")
                                            ("ar" "→")
                                            ))

(abbrev-mode 1) ; turn on abbrev mode

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(require 'rust-mode)

(setq-default cursor-type 'bar) 
(set-cursor-color "#ffffff") 

(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl --dynamic-space-size 1024")
(setq slime-lisp-implementations
'((sbcl ("sbcl" "--dynamic-space-size" "1024"))))


(add-hook 'after-init-hook 'global-company-mode)

(setq lispy-use-sly nil)

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;; (add-hook '(common-lisp-mode
;;             emacs-lisp-mode
;;             lisp-interaction-mode
;;             emacs-lisp-mode
;;             lisp-mode
;;             scheme-mode
;;             racket-mode
;;             lfe-mode
;;             hy-mode
;;             clojure-mode
;;             cider-repl-mode
;;             racket-repl-mode
;;             slime-repl-mode
;;             inferior-lisp-mode
;;             mrepl-mode
;;             ;; comint-mode
;;             sly-mrepl-mode)
;;           )
(add-hook 'common-lisp-mode-hook 'lispy-mode)
(add-hook 'slime-repl-mode-hook 'lispy-mode)
(add-hook 'lisp-mode-hook 'lispy-mode)
(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

(setq column-number-mode t)


;; Emacs mode
(unless (package-installed-p 'elixir-mode)
  (package-install 'elixir-mode))
(add-to-list 'auto-mode-alist '("\\.elixir2\\'" . elixir-mode))


(put 'upcase-region 'disabled nil)
