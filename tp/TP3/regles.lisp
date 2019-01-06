
; source lastword is ;, alors python last-word probability 20%

(defclass $result ()
    (
        (c :accessor ?c :initarg :c :initform 0)
        (cplusplus :accessor ?cplusplus :initarg :cplusplus :initform 0)
        (python :accessor ?python :initarg :python :initform 0)
        (java :accessor ?java :initarg :java :initform 0)
        (javascript :accessor ?javascript :initarg :javascript :initform 0)
        (lisp :accessor ?lisp :initarg :lisp :initform 0)
    )
)

(defclass $probability ()
    (
        (lastCharacter-probability :accessor ?lastCharacter-probability :initarg :lastcharacter-probability :initform NIL)
        (firstword-probability :accessor ?firstword-probability :initarg :firstword-probability :initform NIL)
        (punctuation-probability :accessor ?punctuation-probability :initarg :punctualition-probability :initform NIL)
        (brackets-probability :accessor ?brackets-probability :initarg :brackets-probability :initform NIL)
        (operators-probability :accessor ?operators-probability :initarg :operators-probability :initform NIL)
        (keywords-probability :accessor ?keywords-probability :initarg :keywords-probability :initform NIL)
    )
)

(defclass $source-descriptor ()
    (
        (lastCharacter :accessor ?lastCharacter :initarg :lastcharacter :initform (intern "t"))
        (firstword :accessor ?firstword :initarg :firstword :initform (intern ")"))
        (punctuation :accessor ?punctuation :initarg :punctuation :initform (intern ";"))
        (brackets :accessor ?brackets :initarg :brackets :initform (intern ")"))
        (operators :accessor ?operators :initarg :operators :initform (intern ";"))
        (keywords :accessor ?keywords :initarg :keywords :initform (intern "assert"))
    )
)

(defparameter source (make-instance '$source-descriptor :lastcharacter (intern "t")))
(defparameter *result* (make-instance '$result))

(defparameter languages '())
(defparameter c (make-instance '$probability))
(push c languages)
(defparameter cplusplus (make-instance '$probability))
(push cplusplus languages)
(defparameter python (make-instance '$probability))
(push python languages)
(defparameter java (make-instance '$probability))
(push java languages)
(defparameter javascript (make-instance '$probability))
(push javascript languages)
(defparameter lisp (make-instance '$probability))
(push lisp languages)

(setq regles '(
(R1 
    (
        (equal (?punctuation source) (intern ";"))
    ) 
    (
        (equal (punctuation-probability c) T)
    )
)
(R2 
    (
        (equal (?operators source) (intern "["))
    ) 
    (
        (equal (operators-probability c) T)
    )
)
(R3 
    (
        (equal (?operators source) (intern "."))
    ) 
    (
        (equal (operators-probability c) T)
    )
)
(R4 
    (
        (equal (?operators source) (intern ")"))
    ) 
    (
        (equal (operators-probability c) T)
    )
)
(R5 
    (
        (equal (?operators source) (intern ");"))
    ) 
    (
        (equal (operators-probability c) T)
    )
)
(R6 
    (
        (equal (?operators source) (intern "->"))
    ) 
    (
        (equal (operators-probability c) T)
    )
)
(R7 
    (
        (equal (?operators source) (intern "{"))
    ) 
    (
        (equal (operators-probability c) T)
    )
)
(R8 
    (
        (equal (?operators source) (intern "}"))
    ) 
    (
        (equal (operators-probability c) T)
    )
)
(R9 
    (
        (equal (?operators source) (intern "="))
    ) 
    (
        (equal (operators-probability c) T)
    )
)
(R10 
    (
        (equal (?operators source) (intern ","))
    ) 
    (
        (equal (operators-probability c) T)
    )
)
(R11 
    (
        (equal (?operators source) (intern "("))
    ) 
    (
        (equal (operators-probability c) T)
    )
)
(R12 
    (
        (equal (?operators source) (intern ";"))
    ) 
    (
        (equal (operators-probability c) T)
    )
)
(R13 
    (
        (equal (?lastCharacter source) (intern "y"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R14 
    (
        (equal (?lastCharacter source) (intern "="))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R15 
    (
        (equal (?lastCharacter source) (intern "g"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R16 
    (
        (equal (?lastCharacter source) (intern "l"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R17 
    (
        (equal (?lastCharacter source) (intern "s"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R18 
    (
        (equal (?lastCharacter source) (intern "n"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R19 
    (
        (equal (?lastCharacter source) (intern ":"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R20 
    (
        (equal (?lastCharacter source) (intern "/"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R21 
    (
        (equal (?lastCharacter source) (intern "d"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R22 
    (
        (equal (?lastCharacter source) (intern ","))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R23 
    (
        (equal (?lastCharacter source) (intern ")"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R24 
    (
        (equal (?lastCharacter source) (intern "r"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R25 
    (
        (equal (?lastCharacter source) (intern "e"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R26 
    (
        (equal (?lastCharacter source) (intern "t"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R27 
    (
        (equal (?lastCharacter source) (intern "f"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R28 
    (
        (equal (?lastCharacter source) (intern "{"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R29 
    (
        (equal (?lastCharacter source) (intern "}"))
    ) 
    (
        (equal (lastCharacter-probability c) T)
    )
)
(R30 
    (
        (equal (?keywords source) (intern "char"))
    ) 
    (
        (equal (keywords-probability c) T)
    )
)
(R31 
    (
        (equal (?keywords source) (intern "t"))
    ) 
    (
        (equal (keywords-probability c) T)
    )
)
(R32 
    (
        (equal (?keywords source) (intern "return"))
    ) 
    (
        (equal (keywords-probability c) T)
    )
)
(R33 
    (
        (equal (?keywords source) (intern "i"))
    ) 
    (
        (equal (keywords-probability c) T)
    )
)
(R34 
    (
        (equal (?keywords source) (intern "int"))
    ) 
    (
        (equal (keywords-probability c) T)
    )
)
(R35 
    (
        (equal (?keywords source) (intern "tr"))
    ) 
    (
        (equal (keywords-probability c) T)
    )
)
(R36 
    (
        (equal (?firstWord source) (intern "while"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R37 
    (
        (equal (?firstWord source) (intern "assert"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R38 
    (
        (equal (?firstWord source) (intern "/"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R39 
    (
        (equal (?firstWord source) (intern "#include"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R40 
    (
        (equal (?firstWord source) (intern "for"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R41 
    (
        (equal (?firstWord source) (intern "if("))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R42 
    (
        (equal (?firstWord source) (intern "void"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R43 
    (
        (equal (?firstWord source) (intern "break;"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R44 
    (
        (equal (?firstWord source) (intern "char"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R45 
    (
        (equal (?firstWord source) (intern "struct"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R46 
    (
        (equal (?firstWord source) (intern "case"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R47 
    (
        (equal (?firstWord source) (intern "const"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R48 
    (
        (equal (?firstWord source) (intern "else"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R49 
    (
        (equal (?firstWord source) (intern "static"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R50 
    (
        (equal (?firstWord source) (intern "int"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R51 
    (
        (equal (?firstWord source) (intern "return"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R52 
    (
        (equal (?firstWord source) (intern "if"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R53 
    (
        (equal (?firstWord source) (intern "{"))
    ) 
    (
        (equal (firstWord-probability c) T)
    )
)
(R54 
    (
        (equal (?brackets source) (intern "<"))
    ) 
    (
        (equal (brackets-probability c) T)
    )
)
(R55 
    (
        (equal (?brackets source) (intern "]"))
    ) 
    (
        (equal (brackets-probability c) T)
    )
)
(R56 
    (
        (equal (?brackets source) (intern "["))
    ) 
    (
        (equal (brackets-probability c) T)
    )
)
(R57 
    (
        (equal (?brackets source) (intern ">"))
    ) 
    (
        (equal (brackets-probability c) T)
    )
)
(R58 
    (
        (equal (?brackets source) (intern "{"))
    ) 
    (
        (equal (brackets-probability c) T)
    )
)
(R59 
    (
        (equal (?brackets source) (intern "}"))
    ) 
    (
        (equal (brackets-probability c) T)
    )
)
(R60 
    (
        (equal (?brackets source) (intern ")"))
    ) 
    (
        (equal (brackets-probability c) T)
    )
)
(R61 
    (
        (equal (?punctuation source) (intern ";"))
    ) 
    (
        (equal (punctuation-probability cplusplus) T)
    )
)
(R62 
    (
        (equal (?operators source) (intern "#"))
    ) 
    (
        (equal (operators-probability cplusplus) T)
    )
)
(R63 
    (
        (equal (?operators source) (intern "()"))
    ) 
    (
        (equal (operators-probability cplusplus) T)
    )
)
(R64 
    (
        (equal (?operators source) (intern "();"))
    ) 
    (
        (equal (operators-probability cplusplus) T)
    )
)
(R65 
    (
        (equal (?operators source) (intern ")"))
    ) 
    (
        (equal (operators-probability cplusplus) T)
    )
)
(R66 
    (
        (equal (?operators source) (intern "="))
    ) 
    (
        (equal (operators-probability cplusplus) T)
    )
)
(R67 
    (
        (equal (?operators source) (intern "."))
    ) 
    (
        (equal (operators-probability cplusplus) T)
    )
)
(R68 
    (
        (equal (?operators source) (intern ");"))
    ) 
    (
        (equal (operators-probability cplusplus) T)
    )
)
(R69 
    (
        (equal (?operators source) (intern "::"))
    ) 
    (
        (equal (operators-probability cplusplus) T)
    )
)
(R70 
    (
        (equal (?operators source) (intern "->"))
    ) 
    (
        (equal (operators-probability cplusplus) T)
    )
)
(R71 
    (
        (equal (?operators source) (intern "{"))
    ) 
    (
        (equal (operators-probability cplusplus) T)
    )
)
(R72 
    (
        (equal (?operators source) (intern "}"))
    ) 
    (
        (equal (operators-probability cplusplus) T)
    )
)
(R73 
    (
        (equal (?operators source) (intern ";"))
    ) 
    (
        (equal (operators-probability cplusplus) T)
    )
)
(R74 
    (
        (equal (?operators source) (intern ","))
    ) 
    (
        (equal (operators-probability cplusplus) T)
    )
)
(R75 
    (
        (equal (?operators source) (intern "_"))
    ) 
    (
        (equal (operators-probability cplusplus) T)
    )
)
(R76 
    (
        (equal (?lastCharacter source) (intern "/"))
    ) 
    (
        (equal (lastCharacter-probability cplusplus) T)
    )
)
(R77 
    (
        (equal (?lastCharacter source) (intern "r"))
    ) 
    (
        (equal (lastCharacter-probability cplusplus) T)
    )
)
(R78 
    (
        (equal (?lastCharacter source) (intern ":"))
    ) 
    (
        (equal (lastCharacter-probability cplusplus) T)
    )
)
(R79 
    (
        (equal (?lastCharacter source) (intern ","))
    ) 
    (
        (equal (lastCharacter-probability cplusplus) T)
    )
)
(R80 
    (
        (equal (?lastCharacter source) (intern ">"))
    ) 
    (
        (equal (lastCharacter-probability cplusplus) T)
    )
)
(R81 
    (
        (equal (?lastCharacter source) (intern "e"))
    ) 
    (
        (equal (lastCharacter-probability cplusplus) T)
    )
)
(R82 
    (
        (equal (?lastCharacter source) (intern "t"))
    ) 
    (
        (equal (lastCharacter-probability cplusplus) T)
    )
)
(R83 
    (
        (equal (?lastCharacter source) (intern ")"))
    ) 
    (
        (equal (lastCharacter-probability cplusplus) T)
    )
)
(R84 
    (
        (equal (?lastCharacter source) (intern "{"))
    ) 
    (
        (equal (lastCharacter-probability cplusplus) T)
    )
)
(R85 
    (
        (equal (?lastCharacter source) (intern "}"))
    ) 
    (
        (equal (lastCharacter-probability cplusplus) T)
    )
)
(R86 
    (
        (equal (?keywords source) (intern "void"))
    ) 
    (
        (equal (keywords-probability cplusplus) T)
    )
)
(R87 
    (
        (equal (?keywords source) (intern "d"))
    ) 
    (
        (equal (keywords-probability cplusplus) T)
    )
)
(R88 
    (
        (equal (?keywords source) (intern "const"))
    ) 
    (
        (equal (keywords-probability cplusplus) T)
    )
)
(R89 
    (
        (equal (?keywords source) (intern "return"))
    ) 
    (
        (equal (keywords-probability cplusplus) T)
    )
)
(R90 
    (
        (equal (?firstWord source) (intern "case"))
    ) 
    (
        (equal (firstWord-probability cplusplus) T)
    )
)
(R91 
    (
        (equal (?firstWord source) (intern "return;"))
    ) 
    (
        (equal (firstWord-probability cplusplus) T)
    )
)
(R92 
    (
        (equal (?firstWord source) (intern "/"))
    ) 
    (
        (equal (firstWord-probability cplusplus) T)
    )
)
(R93 
    (
        (equal (?firstWord source) (intern "QString"))
    ) 
    (
        (equal (firstWord-probability cplusplus) T)
    )
)
(R94 
    (
        (equal (?firstWord source) (intern "bool"))
    ) 
    (
        (equal (firstWord-probability cplusplus) T)
    )
)
(R95 
    (
        (equal (?firstWord source) (intern "int"))
    ) 
    (
        (equal (firstWord-probability cplusplus) T)
    )
)
(R96 
    (
        (equal (?firstWord source) (intern "else"))
    ) 
    (
        (equal (firstWord-probability cplusplus) T)
    )
)
(R97 
    (
        (equal (?firstWord source) (intern "#include"))
    ) 
    (
        (equal (firstWord-probability cplusplus) T)
    )
)
(R98 
    (
        (equal (?firstWord source) (intern "void"))
    ) 
    (
        (equal (firstWord-probability cplusplus) T)
    )
)
(R99 
    (
        (equal (?firstWord source) (intern "if"))
    ) 
    (
        (equal (firstWord-probability cplusplus) T)
    )
)
(R100 
    (
        (equal (?firstWord source) (intern "return"))
    ) 
    (
        (equal (firstWord-probability cplusplus) T)
    )
)
(R101 
    (
        (equal (?firstWord source) (intern "{"))
    ) 
    (
        (equal (firstWord-probability cplusplus) T)
    )
)
(R102 
    (
        (equal (?brackets source) (intern "]"))
    ) 
    (
        (equal (brackets-probability cplusplus) T)
    )
)
(R103 
    (
        (equal (?brackets source) (intern "["))
    ) 
    (
        (equal (brackets-probability cplusplus) T)
    )
)
(R104 
    (
        (equal (?brackets source) (intern "<"))
    ) 
    (
        (equal (brackets-probability cplusplus) T)
    )
)
(R105 
    (
        (equal (?brackets source) (intern "{"))
    ) 
    (
        (equal (brackets-probability cplusplus) T)
    )
)
(R106 
    (
        (equal (?brackets source) (intern "}"))
    ) 
    (
        (equal (brackets-probability cplusplus) T)
    )
)
(R107 
    (
        (equal (?brackets source) (intern ">"))
    ) 
    (
        (equal (brackets-probability cplusplus) T)
    )
)
(R108 
    (
        (equal (?brackets source) (intern ")"))
    ) 
    (
        (equal (brackets-probability cplusplus) T)
    )
)
(R109 
    (
        (equal (?punctuation source) (intern ";"))
    ) 
    (
        (equal (punctuation-probability java) T)
    )
)
(R110 
    (
        (equal (?operators source) (intern "()"))
    ) 
    (
        (equal (operators-probability java) T)
    )
)
(R111 
    (
        (equal (?operators source) (intern "();"))
    ) 
    (
        (equal (operators-probability java) T)
    )
)
(R112 
    (
        (equal (?operators source) (intern "_"))
    ) 
    (
        (equal (operators-probability java) T)
    )
)
(R113 
    (
        (equal (?operators source) (intern ");"))
    ) 
    (
        (equal (operators-probability java) T)
    )
)
(R114 
    (
        (equal (?operators source) (intern ")"))
    ) 
    (
        (equal (operators-probability java) T)
    )
)
(R115 
    (
        (equal (?operators source) (intern ","))
    ) 
    (
        (equal (operators-probability java) T)
    )
)
(R116 
    (
        (equal (?operators source) (intern "{"))
    ) 
    (
        (equal (operators-probability java) T)
    )
)
(R117 
    (
        (equal (?operators source) (intern "}"))
    ) 
    (
        (equal (operators-probability java) T)
    )
)
(R118 
    (
        (equal (?operators source) (intern "="))
    ) 
    (
        (equal (operators-probability java) T)
    )
)
(R119 
    (
        (equal (?operators source) (intern ";"))
    ) 
    (
        (equal (operators-probability java) T)
    )
)
(R120 
    (
        (equal (?operators source) (intern "("))
    ) 
    (
        (equal (operators-probability java) T)
    )
)
(R121 
    (
        (equal (?lastCharacter source) (intern ","))
    ) 
    (
        (equal (lastCharacter-probability java) T)
    )
)
(R122 
    (
        (equal (?lastCharacter source) (intern ")"))
    ) 
    (
        (equal (lastCharacter-probability java) T)
    )
)
(R123 
    (
        (equal (?lastCharacter source) (intern ":"))
    ) 
    (
        (equal (lastCharacter-probability java) T)
    )
)
(R124 
    (
        (equal (?lastCharacter source) (intern "/"))
    ) 
    (
        (equal (lastCharacter-probability java) T)
    )
)
(R125 
    (
        (equal (?lastCharacter source) (intern "}"))
    ) 
    (
        (equal (lastCharacter-probability java) T)
    )
)
(R126 
    (
        (equal (?lastCharacter source) (intern "{"))
    ) 
    (
        (equal (lastCharacter-probability java) T)
    )
)
(R127 
    (
        (equal (?keywords source) (intern "int"))
    ) 
    (
        (equal (keywords-probability java) T)
    )
)
(R128 
    (
        (equal (?keywords source) (intern "IRubyObject"))
    ) 
    (
        (equal (keywords-probability java) T)
    )
)
(R129 
    (
        (equal (?keywords source) (intern "new"))
    ) 
    (
        (equal (keywords-probability java) T)
    )
)
(R130 
    (
        (equal (?keywords source) (intern "import"))
    ) 
    (
        (equal (keywords-probability java) T)
    )
)
(R131 
    (
        (equal (?keywords source) (intern "if"))
    ) 
    (
        (equal (keywords-probability java) T)
    )
)
(R132 
    (
        (equal (?keywords source) (intern "return"))
    ) 
    (
        (equal (keywords-probability java) T)
    )
)
(R133 
    (
        (equal (?firstWord source) (intern "break;"))
    ) 
    (
        (equal (firstWord-probability java) T)
    )
)
(R134 
    (
        (equal (?firstWord source) (intern "throw"))
    ) 
    (
        (equal (firstWord-probability java) T)
    )
)
(R135 
    (
        (equal (?firstWord source) (intern "final"))
    ) 
    (
        (equal (firstWord-probability java) T)
    )
)
(R136 
    (
        (equal (?firstWord source) (intern "int"))
    ) 
    (
        (equal (firstWord-probability java) T)
    )
)
(R137 
    (
        (equal (?firstWord source) (intern "case"))
    ) 
    (
        (equal (firstWord-probability java) T)
    )
)
(R138 
    (
        (equal (?firstWord source) (intern "/"))
    ) 
    (
        (equal (firstWord-probability java) T)
    )
)
(R139 
    (
        (equal (?firstWord source) (intern "private"))
    ) 
    (
        (equal (firstWord-probability java) T)
    )
)
(R140 
    (
        (equal (?firstWord source) (intern "if"))
    ) 
    (
        (equal (firstWord-probability java) T)
    )
)
(R141 
    (
        (equal (?firstWord source) (intern "import"))
    ) 
    (
        (equal (firstWord-probability java) T)
    )
)
(R142 
    (
        (equal (?firstWord source) (intern "return"))
    ) 
    (
        (equal (firstWord-probability java) T)
    )
)
(R143 
    (
        (equal (?firstWord source) (intern "public"))
    ) 
    (
        (equal (firstWord-probability java) T)
    )
)
(R144 
    (
        (equal (?brackets source) (intern ">"))
    ) 
    (
        (equal (brackets-probability java) T)
    )
)
(R145 
    (
        (equal (?brackets source) (intern "<"))
    ) 
    (
        (equal (brackets-probability java) T)
    )
)
(R146 
    (
        (equal (?brackets source) (intern "]"))
    ) 
    (
        (equal (brackets-probability java) T)
    )
)
(R147 
    (
        (equal (?brackets source) (intern "["))
    ) 
    (
        (equal (brackets-probability java) T)
    )
)
(R148 
    (
        (equal (?brackets source) (intern "{"))
    ) 
    (
        (equal (brackets-probability java) T)
    )
)
(R149 
    (
        (equal (?brackets source) (intern "}"))
    ) 
    (
        (equal (brackets-probability java) T)
    )
)
(R150 
    (
        (equal (?brackets source) (intern "("))
    ) 
    (
        (equal (brackets-probability java) T)
    )
)
(R151 
    (
        (equal (?punctuation source) (intern ";"))
    ) 
    (
        (equal (punctuation-probability javascript) T)
    )
)
(R152 
    (
        (equal (?operators source) (intern "<"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R153 
    (
        (equal (?operators source) (intern "(!"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R154 
    (
        (equal (?operators source) (intern "||"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R155 
    (
        (equal (?operators source) (intern "/**"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R156 
    (
        (equal (?operators source) (intern "*/"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R157 
    (
        (equal (?operators source) (intern "-"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R158 
    (
        (equal (?operators source) (intern "){"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R159 
    (
        (equal (?operators source) (intern "]"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R160 
    (
        (equal (?operators source) (intern "&&"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R161 
    (
        (equal (?operators source) (intern ":,"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R162 
    (
        (equal (?operators source) (intern "+"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R163 
    (
        (equal (?operators source) (intern "});"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R164 
    (
        (equal (?operators source) (intern "(,"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R165 
    (
        (equal (?operators source) (intern "._"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R166 
    (
        (equal (?operators source) (intern "},"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R167 
    (
        (equal (?operators source) (intern "()"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R168 
    (
        (equal (?operators source) (intern "();"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R169 
    (
        (equal (?operators source) (intern "["))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R170 
    (
        (equal (?operators source) (intern "_"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R171 
    (
        (equal (?operators source) (intern "}"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R172 
    (
        (equal (?operators source) (intern ");"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R173 
    (
        (equal (?operators source) (intern ")"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R174 
    (
        (equal (?operators source) (intern ":"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R175 
    (
        (equal (?operators source) (intern "{"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R176 
    (
        (equal (?operators source) (intern ";"))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R177 
    (
        (equal (?operators source) (intern "="))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R178 
    (
        (equal (?operators source) (intern ","))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R179 
    (
        (equal (?operators source) (intern "("))
    ) 
    (
        (equal (operators-probability javascript) T)
    )
)
(R180 
    (
        (equal (?lastCharacter source) (intern "r"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R181 
    (
        (equal (?lastCharacter source) (intern "\\"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R182 
    (
        (equal (?lastCharacter source) (intern "+"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R183 
    (
        (equal (?lastCharacter source) (intern "n"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R184 
    (
        (equal (?lastCharacter source) (intern ">"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R185 
    (
        (equal (?lastCharacter source) (intern "]"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R186 
    (
        (equal (?lastCharacter source) (intern "["))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R187 
    (
        (equal (?lastCharacter source) (intern "d"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R188 
    (
        (equal (?lastCharacter source) (intern "t"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R189 
    (
        (equal (?lastCharacter source) (intern "s"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R190 
    (
        (equal (?lastCharacter source) (intern "e"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R191 
    (
        (equal (?lastCharacter source) (intern ":"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R192 
    (
        (equal (?lastCharacter source) (intern "*"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R193 
    (
        (equal (?lastCharacter source) (intern "/"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R194 
    (
        (equal (?lastCharacter source) (intern "."))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R195 
    (
        (equal (?lastCharacter source) (intern ")"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R196 
    (
        (equal (?lastCharacter source) (intern "}"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R197 
    (
        (equal (?lastCharacter source) (intern ","))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R198 
    (
        (equal (?lastCharacter source) (intern "{"))
    ) 
    (
        (equal (lastCharacter-probability javascript) T)
    )
)
(R199 
    (
        (equal (?keywords source) (intern "false"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R200 
    (
        (equal (?keywords source) (intern "options"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R201 
    (
        (equal (?keywords source) (intern "else"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R202 
    (
        (equal (?keywords source) (intern "for"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R203 
    (
        (equal (?keywords source) (intern "true"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R204 
    (
        (equal (?keywords source) (intern "length"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R205 
    (
        (equal (?keywords source) (intern "element"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R206 
    (
        (equal (?keywords source) (intern "null"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R207 
    (
        (equal (?keywords source) (intern "get"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R208 
    (
        (equal (?keywords source) (intern "to"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R209 
    (
        (equal (?keywords source) (intern "value"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R210 
    (
        (equal (?keywords source) (intern "i"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R211 
    (
        (equal (?keywords source) (intern "a"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R212 
    (
        (equal (?keywords source) (intern "SC"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R213 
    (
        (equal (?keywords source) (intern "the"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R214 
    (
        (equal (?keywords source) (intern "return"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R215 
    (
        (equal (?keywords source) (intern "var"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R216 
    (
        (equal (?keywords source) (intern "function"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R217 
    (
        (equal (?keywords source) (intern "if"))
    ) 
    (
        (equal (keywords-probability javascript) T)
    )
)
(R218 
    (
        (equal (?firstWord source) (intern "The"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R219 
    (
        (equal (?firstWord source) (intern "case"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R220 
    (
        (equal (?firstWord source) (intern "test(,"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R221 
    (
        (equal (?firstWord source) (intern "else"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R222 
    (
        (equal (?firstWord source) (intern "for"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R223 
    (
        (equal (?firstWord source) (intern "/"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R224 
    (
        (equal (?firstWord source) (intern "function"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R225 
    (
        (equal (?firstWord source) (intern ":"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R226 
    (
        (equal (?firstWord source) (intern "*"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R227 
    (
        (equal (?firstWord source) (intern "{"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R228 
    (
        (equal (?firstWord source) (intern ","))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R229 
    (
        (equal (?firstWord source) (intern "};"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R230 
    (
        (equal (?firstWord source) (intern "*/"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R231 
    (
        (equal (?firstWord source) (intern "/**"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R232 
    (
        (equal (?firstWord source) (intern "});"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R233 
    (
        (equal (?firstWord source) (intern "return"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R234 
    (
        (equal (?firstWord source) (intern "},"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R235 
    (
        (equal (?firstWord source) (intern "if"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R236 
    (
        (equal (?firstWord source) (intern "var"))
    ) 
    (
        (equal (firstWord-probability javascript) T)
    )
)
(R237 
    (
        (equal (?brackets source) (intern ">"))
    ) 
    (
        (equal (brackets-probability javascript) T)
    )
)
(R238 
    (
        (equal (?brackets source) (intern "<"))
    ) 
    (
        (equal (brackets-probability javascript) T)
    )
)
(R239 
    (
        (equal (?brackets source) (intern "]"))
    ) 
    (
        (equal (brackets-probability javascript) T)
    )
)
(R240 
    (
        (equal (?brackets source) (intern "["))
    ) 
    (
        (equal (brackets-probability javascript) T)
    )
)
(R241 
    (
        (equal (?brackets source) (intern "{"))
    ) 
    (
        (equal (brackets-probability javascript) T)
    )
)
(R242 
    (
        (equal (?brackets source) (intern "}"))
    ) 
    (
        (equal (brackets-probability javascript) T)
    )
)
(R243 
    (
        (equal (?brackets source) (intern ")"))
    ) 
    (
        (equal (brackets-probability javascript) T)
    )
)
(R244 
    (
        (equal (?punctuation source) (intern ";"))
    ) 
    (
        (equal (punctuation-probability lisp) T)
    )
)
(R245 
    (
        (equal (?operators source) (intern "'"))
    ) 
    (
        (equal (operators-probability lisp) T)
    )
)
(R246 
    (
        (equal (?operators source) (intern "))"))
    ) 
    (
        (equal (operators-probability lisp) T)
    )
)
(R247 
    (
        (equal (?operators source) (intern "`"))
    ) 
    (
        (equal (operators-probability lisp) T)
    )
)
(R248 
    (
        (equal (?operators source) (intern ","))
    ) 
    (
        (equal (operators-probability lisp) T)
    )
)
(R249 
    (
        (equal (?operators source) (intern "#:"))
    ) 
    (
        (equal (operators-probability lisp) T)
    )
)
(R250 
    (
        (equal (?operators source) (intern "."))
    ) 
    (
        (equal (operators-probability lisp) T)
    )
)
(R251 
    (
        (equal (?operators source) (intern ")"))
    ) 
    (
        (equal (operators-probability lisp) T)
    )
)
(R252 
    (
        (equal (?operators source) (intern ":"))
    ) 
    (
        (equal (operators-probability lisp) T)
    )
)
(R253 
    (
        (equal (?lastCharacter source) (intern "f"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R254 
    (
        (equal (?lastCharacter source) (intern "*"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R255 
    (
        (equal (?lastCharacter source) (intern "c"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R256 
    (
        (equal (?lastCharacter source) (intern "="))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R257 
    (
        (equal (?lastCharacter source) (intern "p"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R258 
    (
        (equal (?lastCharacter source) (intern "@"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R259 
    (
        (equal (?lastCharacter source) (intern "g"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R260 
    (
        (equal (?lastCharacter source) (intern "m"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R261 
    (
        (equal (?lastCharacter source) (intern "y"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R262 
    (
        (equal (?lastCharacter source) (intern ","))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R263 
    (
        (equal (?lastCharacter source) (intern "o"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R264 
    (
        (equal (?lastCharacter source) (intern "'"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R265 
    (
        (equal (?lastCharacter source) (intern "r"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R266 
    (
        (equal (?lastCharacter source) (intern "l"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R267 
    (
        (equal (?lastCharacter source) (intern "d"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R268 
    (
        (equal (?lastCharacter source) (intern "n"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R269 
    (
        (equal (?lastCharacter source) (intern "s"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R270 
    (
        (equal (?lastCharacter source) (intern "t"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R271 
    (
        (equal (?lastCharacter source) (intern "."))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R272 
    (
        (equal (?lastCharacter source) (intern "e"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R273 
    (
        (equal (?lastCharacter source) (intern "`"))
    ) 
    (
        (equal (lastCharacter-probability lisp) T)
    )
)
(R274 
    (
        (equal (?keywords source) (intern "a"))
    ) 
    (
        (equal (keywords-probability lisp) T)
    )
)
(R275 
    (
        (equal (?firstWord source) (intern ":void"))
    ) 
    (
        (equal (firstWord-probability lisp) T)
    )
)
(R276 
    (
        (equal (?firstWord source) (intern "collect"))
    ) 
    (
        (equal (firstWord-probability lisp) T)
    )
)
(R277 
    (
        (equal (?firstWord source) (intern ","))
    ) 
    (
        (equal (firstWord-probability lisp) T)
    )
)
(R278 
    (
        (equal (?firstWord source) (intern ",@"))
    ) 
    (
        (equal (firstWord-probability lisp) T)
    )
)
(R279 
    (
        (equal (?firstWord source) (intern "Return"))
    ) 
    (
        (equal (firstWord-probability lisp) T)
    )
)
(R280 
    (
        (equal (?firstWord source) (intern "do"))
    ) 
    (
        (equal (firstWord-probability lisp) T)
    )
)
(R281 
    (
        (equal (?firstWord source) (intern "for"))
    ) 
    (
        (equal (firstWord-probability lisp) T)
    )
)
(R282 
    (
        (equal (?firstWord source) (intern "'"))
    ) 
    (
        (equal (firstWord-probability lisp) T)
    )
)
(R283 
    (
        (equal (?firstWord source) (intern ")"))
    ) 
    (
        (equal (firstWord-probability lisp) T)
    )
)
(R284 
    (
        (equal (?brackets source) (intern "{"))
    ) 
    (
        (equal (brackets-probability lisp) T)
    )
)
(R285 
    (
        (equal (?brackets source) (intern "}"))
    ) 
    (
        (equal (brackets-probability lisp) T)
    )
)
(R286 
    (
        (equal (?punctuation source) (intern ";"))
    ) 
    (
        (equal (punctuation-probability python) T)
    )
)
(R287 
    (
        (equal (?operators source) (intern "[]"))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R288 
    (
        (equal (?operators source) (intern "))"))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R289 
    (
        (equal (?operators source) (intern "+"))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R290 
    (
        (equal (?operators source) (intern "__"))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R291 
    (
        (equal (?operators source) (intern "%"))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R292 
    (
        (equal (?operators source) (intern "=="))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R293 
    (
        (equal (?operators source) (intern "-"))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R294 
    (
        (equal (?operators source) (intern "._"))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R295 
    (
        (equal (?operators source) (intern "]"))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R296 
    (
        (equal (?operators source) (intern "):"))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R297 
    (
        (equal (?operators source) (intern ":"))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R298 
    (
        (equal (?operators source) (intern "["))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R299 
    (
        (equal (?operators source) (intern "()"))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R300 
    (
        (equal (?operators source) (intern ")"))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R301 
    (
        (equal (?operators source) (intern "="))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R302 
    (
        (equal (?operators source) (intern ","))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R303 
    (
        (equal (?operators source) (intern "("))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R304 
    (
        (equal (?operators source) (intern "_"))
    ) 
    (
        (equal (operators-probability python) T)
    )
)
(R305 
    (
        (equal (?lastCharacter source) (intern "m"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R306 
    (
        (equal (?lastCharacter source) (intern "f"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R307 
    (
        (equal (?lastCharacter source) (intern ">"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R308 
    (
        (equal (?lastCharacter source) (intern "o"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R309 
    (
        (equal (?lastCharacter source) (intern "2"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R310 
    (
        (equal (?lastCharacter source) (intern "h"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R311 
    (
        (equal (?lastCharacter source) (intern "a"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R312 
    (
        (equal (?lastCharacter source) (intern "\\"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R313 
    (
        (equal (?lastCharacter source) (intern "-"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R314 
    (
        (equal (?lastCharacter source) (intern "k"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R315 
    (
        (equal (?lastCharacter source) (intern "["))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R316 
    (
        (equal (?lastCharacter source) (intern "{"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R317 
    (
        (equal (?lastCharacter source) (intern "p"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R318 
    (
        (equal (?lastCharacter source) (intern "l"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R319 
    (
        (equal (?lastCharacter source) (intern "g"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R320 
    (
        (equal (?lastCharacter source) (intern "}"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R321 
    (
        (equal (?lastCharacter source) (intern "("))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R322 
    (
        (equal (?lastCharacter source) (intern "1"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R323 
    (
        (equal (?lastCharacter source) (intern "0"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R324 
    (
        (equal (?lastCharacter source) (intern "d"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R325 
    (
        (equal (?lastCharacter source) (intern "y"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R326 
    (
        (equal (?lastCharacter source) (intern "n"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R327 
    (
        (equal (?lastCharacter source) (intern "r"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R328 
    (
        (equal (?lastCharacter source) (intern "="))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R329 
    (
        (equal (?lastCharacter source) (intern "t"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R330 
    (
        (equal (?lastCharacter source) (intern "."))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R331 
    (
        (equal (?lastCharacter source) (intern "]"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R332 
    (
        (equal (?lastCharacter source) (intern "s"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R333 
    (
        (equal (?lastCharacter source) (intern ","))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R334 
    (
        (equal (?lastCharacter source) (intern "e"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R335 
    (
        (equal (?lastCharacter source) (intern ":"))
    ) 
    (
        (equal (lastCharacter-probability python) T)
    )
)
(R336 
    (
        (equal (?keywords source) (intern "assert"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R337 
    (
        (equal (?keywords source) (intern "file"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R338 
    (
        (equal (?keywords source) (intern "type"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R339 
    (
        (equal (?keywords source) (intern "array"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R340 
    (
        (equal (?keywords source) (intern "os"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R341 
    (
        (equal (?keywords source) (intern "class"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R342 
    (
        (equal (?keywords source) (intern "i"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R343 
    (
        (equal (?keywords source) (intern "np"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R344 
    (
        (equal (?keywords source) (intern "else"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R345 
    (
        (equal (?keywords source) (intern "of"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R346 
    (
        (equal (?keywords source) (intern "data"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R347 
    (
        (equal (?keywords source) (intern "and"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R348 
    (
        (equal (?keywords source) (intern "from"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R349 
    (
        (equal (?keywords source) (intern "not"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R350 
    (
        (equal (?keywords source) (intern "get"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R351 
    (
        (equal (?keywords source) (intern "to"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R352 
    (
        (equal (?keywords source) (intern "x"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R353 
    (
        (equal (?keywords source) (intern "path"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R354 
    (
        (equal (?keywords source) (intern "is"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R355 
    (
        (equal (?keywords source) (intern "for"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R356 
    (
        (equal (?keywords source) (intern "import"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R357 
    (
        (equal (?keywords source) (intern "None"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R358 
    (
        (equal (?keywords source) (intern "a"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R359 
    (
        (equal (?keywords source) (intern "name"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R360 
    (
        (equal (?keywords source) (intern "the"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R361 
    (
        (equal (?keywords source) (intern "in"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R362 
    (
        (equal (?keywords source) (intern "return"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R363 
    (
        (equal (?keywords source) (intern "def"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R364 
    (
        (equal (?keywords source) (intern "if"))
    ) 
    (
        (equal (keywords-probability python) T)
    )
)
(R365 
    (
        (equal (?firstWord source) (intern "while"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R366 
    (
        (equal (?firstWord source) (intern "data"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R367 
    (
        (equal (?firstWord source) (intern "self.path()"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R368 
    (
        (equal (?firstWord source) (intern "try:"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R369 
    (
        (equal (?firstWord source) (intern "pass"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R370 
    (
        (equal (?firstWord source) (intern ")"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R371 
    (
        (equal (?firstWord source) (intern "The"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R372 
    (
        (equal (?firstWord source) (intern "else:"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R373 
    (
        (equal (?firstWord source) (intern "assert"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R374 
    (
        (equal (?firstWord source) (intern ","))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R375 
    (
        (equal (?firstWord source) (intern "try"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R376 
    (
        (equal (?firstWord source) (intern "elif"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R377 
    (
        (equal (?firstWord source) (intern ">>>"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R378 
    (
        (equal (?firstWord source) (intern "except"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R379 
    (
        (equal (?firstWord source) (intern "print"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R380 
    (
        (equal (?firstWord source) (intern "raise"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R381 
    (
        (equal (?firstWord source) (intern "else"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R382 
    (
        (equal (?firstWord source) (intern "class"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R383 
    (
        (equal (?firstWord source) (intern "import"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R384 
    (
        (equal (?firstWord source) (intern "from"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R385 
    (
        (equal (?firstWord source) (intern "for"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R386 
    (
        (equal (?firstWord source) (intern "return"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R387 
    (
        (equal (?firstWord source) (intern "def"))
    ) 
    (
        (equal (firstWord-probability python) T)
    )
)
(R388 
    (
        (equal (?brackets source) (intern "}"))
    ) 
    (
        (equal (brackets-probability python) T)
    )
)
(R389 
    (
        (equal (?brackets source) (intern "{"))
    ) 
    (
        (equal (brackets-probability python) T)
    )
)
(R390 
    (
        (equal (?brackets source) (intern "<"))
    ) 
    (
        (equal (brackets-probability python) T)
    )
)
(R391 
    (
        (equal (?brackets source) (intern ">"))
    ) 
    (
        (equal (brackets-probability python) T)
    )
)
(R392 
    (
        (equal (?brackets source) (intern "]"))
    ) 
    (
        (equal (brackets-probability python) T)
    )
)
(R393 
    (
        (equal (?brackets source) (intern "["))
    ) 
    (
        (equal (brackets-probability python) T)
    )
)
(R394 
    (
        (equal (?brackets source) (intern ")"))
    ) 
    (
        (equal (brackets-probability python) T)
    )
)
(R395
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 2)
    )
)
(R396
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 3)
    )
)
(R397
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 1)
    )
)
(R398
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 2)
    )
)
(R399
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 3)
    )
)
(R400
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 4)
    )
)
(R401
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 2)
    )
)
(R402
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 3)
    )
)
(R403
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 1)
    )
)
(R404
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 2)
    )
)
(R405
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 0)
    )
)
(R406
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 1)
    )
)
(R407
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 2)
    )
)
(R408
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 3)
    )
)
(R409
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 1)
    )
)
(R410
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 2)
    )
)
(R411
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 3)
    )
)
(R412
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 4)
    )
)
(R413
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 2)
    )
)
(R414
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 3)
    )
)
(R415
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 4)
    )
)
(R416
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 5)
    )
)
(R417
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 3)
    )
)
(R418
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 4)
    )
)
(R419
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 2)
    )
)
(R420
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 3)
    )
)
(R421
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 1)
    )
)
(R422
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 2)
    )
)
(R423
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 3)
    )
)
(R424
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 4)
    )
)
(R425
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 2)
    )
)
(R426
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) NIL)
)
    (
        (equal (C *result*) 3)
    )
)
(R427
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 3)
    )
)
(R428
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 4)
    )
)
(R429
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 2)
    )
)
(R430
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 3)
    )
)
(R431
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 4)
    )
)
(R432
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 5)
    )
)
(R433
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 3)
    )
)
(R434
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 4)
    )
)
(R435
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 2)
    )
)
(R436
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 3)
    )
)
(R437
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 1)
    )
)
(R438
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 2)
    )
)
(R439
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 3)
    )
)
(R440
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 4)
    )
)
(R441
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 2)
    )
)
(R442
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) NIL)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 3)
    )
)
(R443
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 4)
    )
)
(R444
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 5)
    )
)
(R445
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 3)
    )
)
(R446
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 4)
    )
)
(R447
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 5)
    )
)
(R448
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 6)
    )
)
(R449
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 4)
    )
)
(R450
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) T)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 5)
    )
)
(R451
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 3)
    )
)
(R452
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 4)
    )
)
(R453
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 2)
    )
)
(R454
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) NIL)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 3)
    )
)
(R455
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 4)
    )
)
(R456
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) T)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 5)
    )
)
(R457
    (
        (equal (?LASTCHARACTER-PROBABILITY C) NIL)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 3)
    )
)
(R458
    (
        (equal (?LASTCHARACTER-PROBABILITY C) T)
        (equal (?FIRSTWORD-PROBABILITY C) NIL)
        (equal (?PUNCTUATION-PROBABILITY C) T)
        (equal (?BRACKETS-PROBABILITY C) NIL)
        (equal (?OPERATORS-PROBABILITY C) T)
        (equal (?KEYWORDS-PROBABILITY C) T)
)
    (
        (equal (C *result*) 4)
    )
)
(R459
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R460
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R461
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 1)
    )
)
(R462
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R463
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R464
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R465
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R466
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R467
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 1)
    )
)
(R468
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R469
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 0)
    )
)
(R470
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 1)
    )
)
(R471
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R472
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R473
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 1)
    )
)
(R474
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R475
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R476
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R477
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R478
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R479
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R480
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 5)
    )
)
(R481
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R482
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R483
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R484
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R485
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 1)
    )
)
(R486
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R487
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R488
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R489
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R490
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) NIL)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R491
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R492
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R493
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R494
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R495
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R496
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 5)
    )
)
(R497
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R498
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R499
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R500
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R501
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 1)
    )
)
(R502
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R503
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R504
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R505
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R506
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R507
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R508
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 5)
    )
)
(R509
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R510
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R511
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 5)
    )
)
(R512
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 6)
    )
)
(R513
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R514
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) T)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 5)
    )
)
(R515
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R516
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R517
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 2)
    )
)
(R518
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) NIL)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R519
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R520
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) T)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 5)
    )
)
(R521
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) NIL)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 3)
    )
)
(R522
    (
        (equal (?LASTCHARACTER-PROBABILITY CPLUSPLUS) T)
        (equal (?FIRSTWORD-PROBABILITY CPLUSPLUS) NIL)
        (equal (?PUNCTUATION-PROBABILITY CPLUSPLUS) T)
        (equal (?BRACKETS-PROBABILITY CPLUSPLUS) NIL)
        (equal (?OPERATORS-PROBABILITY CPLUSPLUS) T)
        (equal (?KEYWORDS-PROBABILITY CPLUSPLUS) T)
)
    (
        (equal (CPLUSPLUS *result*) 4)
    )
)
(R523
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R524
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R525
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 1)
    )
)
(R526
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R527
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R528
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R529
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R530
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R531
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 1)
    )
)
(R532
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R533
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 0)
    )
)
(R534
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 1)
    )
)
(R535
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R536
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R537
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 1)
    )
)
(R538
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R539
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R540
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R541
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R542
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R543
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R544
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 5)
    )
)
(R545
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R546
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R547
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R548
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R549
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 1)
    )
)
(R550
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R551
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R552
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R553
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R554
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) NIL)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R555
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R556
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R557
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R558
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R559
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R560
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 5)
    )
)
(R561
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R562
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R563
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R564
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R565
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 1)
    )
)
(R566
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R567
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R568
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R569
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R570
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R571
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R572
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 5)
    )
)
(R573
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R574
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R575
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 5)
    )
)
(R576
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 6)
    )
)
(R577
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R578
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) T)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 5)
    )
)
(R579
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R580
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R581
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 2)
    )
)
(R582
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) NIL)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R583
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R584
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) T)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 5)
    )
)
(R585
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 3)
    )
)
(R586
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVA) T)
        (equal (?FIRSTWORD-PROBABILITY JAVA) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVA) T)
        (equal (?BRACKETS-PROBABILITY JAVA) NIL)
        (equal (?OPERATORS-PROBABILITY JAVA) T)
        (equal (?KEYWORDS-PROBABILITY JAVA) T)
)
    (
        (equal (JAVA *result*) 4)
    )
)
(R587
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R588
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R589
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 1)
    )
)
(R590
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R591
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R592
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R593
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R594
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R595
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 1)
    )
)
(R596
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R597
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 0)
    )
)
(R598
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 1)
    )
)
(R599
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R600
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R601
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 1)
    )
)
(R602
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R603
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R604
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R605
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R606
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R607
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R608
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 5)
    )
)
(R609
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R610
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R611
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R612
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R613
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 1)
    )
)
(R614
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R615
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R616
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R617
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R618
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) NIL)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R619
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R620
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R621
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R622
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R623
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R624
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 5)
    )
)
(R625
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R626
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R627
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R628
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R629
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 1)
    )
)
(R630
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R631
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R632
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R633
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R634
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R635
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R636
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 5)
    )
)
(R637
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R638
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R639
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 5)
    )
)
(R640
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 6)
    )
)
(R641
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R642
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) T)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 5)
    )
)
(R643
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R644
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R645
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 2)
    )
)
(R646
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) NIL)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R647
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R648
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) T)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 5)
    )
)
(R649
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) NIL)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 3)
    )
)
(R650
    (
        (equal (?LASTCHARACTER-PROBABILITY JAVASCRIPT) T)
        (equal (?FIRSTWORD-PROBABILITY JAVASCRIPT) NIL)
        (equal (?PUNCTUATION-PROBABILITY JAVASCRIPT) T)
        (equal (?BRACKETS-PROBABILITY JAVASCRIPT) NIL)
        (equal (?OPERATORS-PROBABILITY JAVASCRIPT) T)
        (equal (?KEYWORDS-PROBABILITY JAVASCRIPT) T)
)
    (
        (equal (JAVASCRIPT *result*) 4)
    )
)
(R651
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R652
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R653
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 1)
    )
)
(R654
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R655
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R656
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R657
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R658
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R659
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 1)
    )
)
(R660
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R661
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 0)
    )
)
(R662
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 1)
    )
)
(R663
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R664
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R665
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 1)
    )
)
(R666
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R667
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R668
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R669
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R670
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R671
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R672
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 5)
    )
)
(R673
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R674
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R675
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R676
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R677
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 1)
    )
)
(R678
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R679
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R680
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R681
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R682
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) NIL)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R683
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R684
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R685
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R686
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R687
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R688
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 5)
    )
)
(R689
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R690
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R691
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R692
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R693
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 1)
    )
)
(R694
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R695
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R696
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R697
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R698
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) NIL)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R699
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R700
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 5)
    )
)
(R701
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R702
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R703
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 5)
    )
)
(R704
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 6)
    )
)
(R705
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R706
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) T)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 5)
    )
)
(R707
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R708
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R709
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 2)
    )
)
(R710
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) NIL)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R711
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R712
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) T)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 5)
    )
)
(R713
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) NIL)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 3)
    )
)
(R714
    (
        (equal (?LASTCHARACTER-PROBABILITY LISP) T)
        (equal (?FIRSTWORD-PROBABILITY LISP) NIL)
        (equal (?PUNCTUATION-PROBABILITY LISP) T)
        (equal (?BRACKETS-PROBABILITY LISP) NIL)
        (equal (?OPERATORS-PROBABILITY LISP) T)
        (equal (?KEYWORDS-PROBABILITY LISP) T)
)
    (
        (equal (LISP *result*) 4)
    )
)
(R715
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R716
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R717
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 1)
    )
)
(R718
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R719
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R720
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R721
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R722
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R723
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 1)
    )
)
(R724
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R725
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 0)
    )
)
(R726
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 1)
    )
)
(R727
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R728
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R729
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 1)
    )
)
(R730
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R731
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R732
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R733
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R734
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R735
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R736
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 5)
    )
)
(R737
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R738
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R739
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R740
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R741
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 1)
    )
)
(R742
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R743
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R744
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R745
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R746
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) NIL)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R747
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R748
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R749
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R750
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R751
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R752
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 5)
    )
)
(R753
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R754
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R755
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R756
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R757
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 1)
    )
)
(R758
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R759
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R760
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R761
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R762
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) NIL)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R763
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R764
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 5)
    )
)
(R765
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R766
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R767
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 5)
    )
)
(R768
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 6)
    )
)
(R769
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R770
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) T)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 5)
    )
)
(R771
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R772
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R773
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 2)
    )
)
(R774
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) NIL)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R775
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R776
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) T)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 5)
    )
)
(R777
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) NIL)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 3)
    )
)
(R778
    (
        (equal (?LASTCHARACTER-PROBABILITY PYTHON) T)
        (equal (?FIRSTWORD-PROBABILITY PYTHON) NIL)
        (equal (?PUNCTUATION-PROBABILITY PYTHON) T)
        (equal (?BRACKETS-PROBABILITY PYTHON) NIL)
        (equal (?OPERATORS-PROBABILITY PYTHON) T)
        (equal (?KEYWORDS-PROBABILITY PYTHON) T)
)
    (
        (equal (PYTHON *result*) 4)
    )
)
(R779 
    (
        (>= (?python *result*) 4)
    ) 
    (
        (print "Le code est probablement python
")
    )
)
(R780 
    (
        (>= (?lisp *result*) 4)
    ) 
    (
        (print "Le code est probablement lisp
")
    )
)
(R781 
    (
        (>= (?javascript *result*) 4)
    ) 
    (
        (print "Le code est probablement javascript
")
    )
)
(R782 
    (
        (>= (?java *result*) 4)
    ) 
    (
        (print "Le code est probablement java
")
    )
)
(R783 
    (
        (>= (?cplusplus *result*) 4)
    ) 
    (
        (print "Le code est probablement cplusplus
")
    )
)
(R784 
    (
        (>= (?c *result*) 4)
    ) 
    (
        (print "Le code est probablement c
")
    )
)

    )
)

(defun nom (regle)
    (car regle)
)

(defun premisses (regle)
    (cadr regle)
)

(defun conclusions (regle)
    (caddr regle)
)

(defun appartient (item items)
    (dolist (sub-item items)
        (if (equal sub-item item)
            (return T)
            NIL
        )
    )
)

(defun RegleCanditat (but regles)     
    (if (null regles) 
        NIL         
        ()
    ) 
) 

;(print (appartient '(setf (?lastcharacter-probability c) 0.5) (caddar regles)))

;(print (equal (?lastcharacter source) (intern ";")))
