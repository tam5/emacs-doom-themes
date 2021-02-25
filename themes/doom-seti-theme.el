;;; doom-seti-theme.el --- inspired by something -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-seti-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-seti-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-seti-theme
  :type 'boolean)

(defcustom doom-seti-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-seti-theme
  :type 'boolean)

(defcustom doom-seti-comment-bg doom-seti-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-seti-theme
  :type 'boolean)

(defcustom doom-seti-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-seti-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-seti
  "A dark theme inspired by Atom One Dark"

  ;; name        default   256       16
  ((bg         '("#282c34" nil       nil            ))
   (bg-alt     '("#0D1011" nil       nil            ))
   (base0      '("#1B2229" "black"   "black"        ))
   (base1      '("#1c1f24" "#1e1e1e" "brightblack"  ))
   (base2      '("#202328" "#2e2e2e" "brightblack"  ))
   (base3      '("#23272e" "#262626" "brightblack"  ))
   (base4      '("#3f444a" "#3f3f3f" "brightblack"  ))
   (base5      '("#5B6268" "#525252" "brightblack"  ))
   (base6      '("#73797e" "#6b6b6b" "brightblack"  ))
   (base7      '("#9ca0a4" "#979797" "brightblack"  ))
   (base8      '("#DFDFDF" "#dfdfdf" "white"        ))
   (fg         '("#bbc2cf" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("#5B6268" "#2d2d2d" "white"        ))

   (grey       base4)
   (red        '("#ff6c6b" "#ff6655" "red"          ))
   (orange     '("#da8548" "#dd8844" "brightred"    ))
   (green      '("#98be65" "#99bb66" "green"        ))
   (teal       '("#4db5bd" "#44b9b1" "brightgreen"  ))
   (yellow     '("#ECBE7B" "#ECBE7B" "yellow"       ))
   (blue       '("#51afef" "#51afef" "brightblue"   ))
   (dark-blue  '("#2257A0" "#2257A0" "blue"         ))
   (magenta    '("#c678dd" "#c678dd" "brightmagenta"))
   (violet     '("#a9a1e1" "#a9a1e1" "magenta"      ))
   (cyan       '("#46D9FF" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#5699AF" "#5699AF" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        magenta)
   (comments       (if doom-seti-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-seti-brighter-comments dark-cyan base5) 0.25))
   (constants      violet)
   (functions      magenta)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        green)
   (variables      (doom-lighten magenta 0.4))
   (numbers        orange)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-seti-brighter-modeline)
   (-modeline-pad
    (when doom-seti-padded-modeline
      (if (integerp doom-seti-padded-modeline) doom-seti-padded-modeline 4)))

   (modeline-fg     fg)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (doom-darken blue 0.475)
      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken blue 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt)))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (evil-goggles-default-face :inherit 'region :background (doom-blend region bg 0.5))

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-seti-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; Doom modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)

   ;; ivy-mode
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; LaTeX-mode
   (font-latex-math-face :foreground green)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden)

   ;; lsp-mode
   (lsp-headerline-breadcrumb-separator-face :foreground green)

   ;; rjsx
   (rjsx-tag :foreground red)
   (rjsx-attr :foreground orange)


   (treemacs-file-face :foreground "#aaaaaa")
   (treemacs-directory-face :foreground "#aaaaaa")
   (treemacs-root-face :foreground "#aaaaaa")


   (all-the-icons-red :foreground "#B42839")
   (all-the-icons-lred :foreground "#E54542")
   (all-the-icons-dred :foreground "#CB3837")
   (all-the-icons-red-alt :foreground "#671855")
   (all-the-icons-green :foreground "#ffffff")
   (all-the-icons-lgreen :foreground "#43D16B")
   (all-the-icons-dgreen :foreground "#ffffff")
   (all-the-icons-yellow :foreground "#F0DC3E")
   (all-the-icons-lyellow :foreground "#EED982")
   (all-the-icons-dyellow :foreground "#FAA91A")
   (all-the-icons-blue :foreground "#356EA0")
   (all-the-icons-blue-alt :foreground "#283249")
   (all-the-icons-lblue :foreground "#29A8DE")
   (all-the-icons-dblue :foreground "#1F77CE")
   (all-the-icons-maroon :foreground "#ffffff")
   (all-the-icons-lmaroon :foreground "#ffffff")
   (all-the-icons-dmaroon :foreground "#6C5FA9")
   (all-the-icons-purple :foreground "#4A37BA")
   (all-the-icons-purple-alt :foreground "#7F50B1")
   (all-the-icons-lpurple :foreground "#8C6184")
   (all-the-icons-dpurple :foreground "#542D8D")
   (all-the-icons-orange :foreground "#EF7A39")
   (all-the-icons-lorange :foreground "#F0582B")
   (all-the-icons-dorange :foreground "#F0582B")
   (all-the-icons-cyan :foreground "#00E4FF")
   (all-the-icons-cyan-alt :foreground "#35BAA0")
   (all-the-icons-lcyan :foreground "#829EC2")
   (all-the-icons-dcyan :foreground "#ffffff")
   (all-the-icons-pink :foreground "#FF4893")
   (all-the-icons-lpink :foreground "#BCA784")
   (all-the-icons-dpink :foreground "#ffffff")
   (all-the-icons-silver :foreground "#40535B")
   (all-the-icons-lsilver :foreground "#ffffff")
   (all-the-icons-dsilver :foreground "#40535B")

   )

  ;; --- extra variables ---------------------
  ()
  )

;;; doom-seti-theme.el ends here
