;;; doom-duotone-dark-theme.el --- inspired by something -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-duotone-dark-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-duotone-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-duotone-dark-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-duotone-dark
  "A dark theme inspired by Atom One Dark"

  ;; name        default   256       16
  ((uno-1 '("#F2F1FF"))
   (uno-2 '("#CEC8FD"))
   (uno-3 '("#B3A9FC"))
   (uno-4 '("#6C6882"))
   (uno-5 '("#524E64"))

   (duo-1 '("#FED5AC"))
   (duo-2 '("#EAAE70"))
   (duo-3 '("#8F8882"))

   (accent '("#F39E50" nil nil))

   (bg-1 '("#2D2B38"))
   (bg-2 (doom-darken bg-1 0.3))

   (bg         bg-1)                                   ;; main background
   (bg-alt     bg-2)                                   ;; sidebar and outer background
   (base0      uno-4) ;; swiper fg
   (base1      bg-2) ;; window dividers, completion
   (base2      nil) ;; pulse flash
   (base3      bg-2) ;; highlight of completion
   (base4      uno-4)
   (base5      uno-4)
   (base6      uno-3)
   (base7      uno-3)
   (base8      nil)
   (fg         uno-1)
   (fg-alt     '("#D8D7E0" "#bfbfbf" "brightwhite"  ))

   (grey       base4)
   (red        uno-2)
   (orange     duo-2)
   (green      uno-3)
   (teal       '("#19A288" "#0088cc" "brightgreen"  ))
   (yellow     accent)
   (blue       uno-3)
   (dark-blue  uno-4)
   (magenta    uno-4)
   (violet     duo-3)
   (cyan       uno-2)
   (dark-cyan  uno-2)

   ;; face categories -- required for all themes
   (highlight      accent)
   (vertical-bar   bg-alt)
   (selection      uno-5)
   (builtin        duo-2)
   (comments       uno-5)
   (doc-comments   uno-5)
   (constants      duo-1)
   (functions      uno-1)
   (keywords       duo-2)
   (methods        uno-1)
   (operators      duo-2)
   (type           uno-1)
   (strings        duo-1)
   (variables      uno-2)
   (numbers        duo-2)
   (region         uno-5)

   (error          "#ff5370")
   (warning        "#ffcb6b")
   (success        "#c3e88d")
   (vc-modified    warning)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories

   (-modeline-pad
    (when doom-duotone-dark-padded-modeline
      (if (integerp doom-duotone-dark-padded-modeline) doom-duotone-dark-padded-modeline 4)))

   (modeline-fg    fg-alt)
   (modeline-fg-alt base5)

   (modeline-bg (doom-darken bg 0.15))
   (modeline-bg-inactive bg))

  ;; --- extra faces ------------------------
  ((match               :foreground yellow      :background nil :weight 'bold)
   (highlight           :background nil  :foreground fg :distant-foreground nil) ;;; buttons and stuff
   (lazy-highlight      :background nil :box `(:line-width -1 :color uno-3))
   (paren-face-match    :foreground nil   :background nil :weight 'ultra-bold :underline t)
   (minibuffer-prompt   :foreground fg-alt)

   ((line-number &override) :foreground uno-5)
   ((line-number-current-line &override) :foreground uno-3)

   (doom-modeline-bar :background nil)
   (doom-modeline-project-root-dir :foreground fg-alt :weight 'normal)
   (doom-modeline-project-dir :foreground fg-alt :weight 'normal)
   (doom-modeline-buffer-path :foreground fg-alt :weight 'normal)
   (doom-modeline-buffer-file :foreground fg-alt :weight 'normal)
   (doom-modeline-buffer-modified :foreground fg-alt :weight 'normal)
   (doom-modeline-info :foreground fg-alt)
   ;; (doom-modeline-bar :foreground green)
   ;; (doom-modeline-highlight :foreground blue)

   (mode-line
    :family "Roboto" :height 125 :weight 'normal
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :family "Roboto" :height 125 :weight 'normal
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground nil)

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))


    (tooltip              :background nil :foreground nil)

   ;; --- major-mode faces -------------------
   (treemacs-file-face :foreground uno-4)
   (treemacs-directory-face :foreground uno-4)
   (treemacs-root-face :foreground uno-4)

    ;;;; ivy
    (ivy-current-match :background region :distant-foreground nil :extend t)
    (ivy-minibuffer-match-face-1
     :background nil
     :foreground (doom-lighten grey 0.14)
     :weight 'light)
    (ivy-minibuffer-match-face-2
     :inherit 'ivy-minibuffer-match-face-1
     :foreground highlight :background nil :weight 'semi-bold)
    (ivy-minibuffer-match-face-3 :inherit 'ivy-minibuffer-match-face-2)
    (ivy-minibuffer-match-face-4 :inherit 'ivy-minibuffer-match-face-2)
    (ivy-minibuffer-match-highlight :foreground "#ffff00")
    (ivy-highlight-face :foreground "#ff00ff")
    (ivy-confirm-face :foreground "#ff00ff")
    (ivy-grep-info :foreground uno-4)
    (ivy-match-required-face :foreground error)
    (ivy-virtual :inherit 'italic :foreground doc-comments)
    (ivy-modified-buffer :inherit 'bold :foreground vc-modified)))
   ;; ;; js2-mode
   ;; (js2-external-variable :foreground violet)
   ;; (js2-function-param :foreground cyan)
   ;; (js2-jsdoc-html-tag-delimiter :foreground yellow)
   ;; (js2-jsdoc-html-tag-name :foreground dark-blue)
   ;; (js2-jsdoc-value :foreground yellow)
   ;; (js2-private-function-call :foreground cyan)
   ;; (js2-private-member :foreground base7)

   ;; ;; web-mode
   ;; (web-mode-builtin-face :foreground orange)
   ;; (web-mode-css-selector-face :foreground green)
   ;; (web-mode-html-attr-name-face :foreground green)
   ;; (web-mode-html-tag-bracket-face :inherit 'default)
   ;; (web-mode-html-tag-face :foreground magenta :weight 'bold)
   ;; (web-mode-preprocessor-face :foreground orange)

(provide 'doom-duotone-dark-theme)
;;; doom-duotone-dark-theme.el ends here
