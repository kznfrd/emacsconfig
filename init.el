;; Macの場合
(require 'cask)
;; Linuxの場合
;; use-package
 
(cask-initialize)
(require 'use-package)

;; 日本語IM用の設定
(setq default-input-method "MacOSX")

;; 日本語の設定（UTF-8）
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; Auto-complete
(use-package auto-complete)
(ac-config-default)
(ac-set-trigger-key "TAB")

;; '¥' を入力したら '\' となるように
(define-key global-map [?¥] [?\\])

;; 警告音もフラッシュも全て無効
(setq ring-bell-function 'ignore)

;;;　行番号の表示
(global-linum-mode t)

;;; 現在行を目立たせる
(global-hl-line-mode)

;; バックアップファイルを作らないようにする
(setq make-backup-files nil)
;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; キーバインド
(define-key global-map (kbd "C-h") 'delete-backward-char) ; 削除
(define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
(define-key global-map (kbd "C-z") 'undo)                 ; undo
(define-key global-map (kbd "C-c i") 'indent-region)      ; インデント
(define-key global-map (kbd "C-c C-i") 'hippie-expand)    ; 補完
;(define-key global-map (kbd "C-c ;") 'comment-dwim)       ; コメントアウト
(define-key global-map (kbd "C-o") 'toggle-input-method)  ; 日本語入力切替
;(define-key global-map (kbd "M-C-g") 'grep)               ; grep
(define-key global-map (kbd "C-[ M-C-g") 'goto-line)      ; 指定行へ移動
(global-set-key [f8] 'neotree-toggle)                      ;neotree
;;; 対応する括弧を光らせる。
(show-paren-mode 1)
;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)

;;; 日本語入力時、カーソル色を変える
(when (fboundp 'mac-input-source)
  (defun my-mac-selected-keyboard-input-source-chage-function ()
    "英語のときはカーソルの色を黄色に、日本語のときは赤にします."
    (let ((mac-input-source (mac-input-source)))
      (set-cursor-color
       (if (string-match "\\.US$" mac-input-source)
	   "Yellow" "Red"))))
  (add-hook 'mac-selected-keyboard-input-source-change-hook
	    'my-mac-selected-keyboard-input-source-chage-function))

;; ツールバーを非表示
(tool-bar-mode 0)

;;; Appearences
;(use-package color-theme-tango)
;(use-package color-theme-solarized)
;(use-package solarized-theme)
;(load-theme 'solarized-dark t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((top . 150) (left . 150)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; python-mode
(use-package python-mode)

;;; auto pep
(require 'py-autopep8)
(setq py-autopep8-options '("--max-line-length=200"))
(setq flycheck-flake8-maximum-line-length 200)
(py-autopep8-enable-on-save)

;;; Python Jedi
(use-package jedi)
(add-hook 'python-mode-hook
          '(lambda()
             (jedi:ac-setup)
             (setq jedi:complete-on-dot t)
             (local-set-key (kbd "M-TAB") 'jedi:complete)))

;; darclua-theme
(use-package darcula-theme
  :ensure t
  :config
  ;; your preferred main font face here
  (set-frame-font "Inconsolata-14"))

;; flake
()
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/flake8")

(custom-set-variables
 '(flymake-python-pyflakes-extra-arguments (quote ("--max-line-length=120" "--ignore=E128"))))

(package-initialize)
