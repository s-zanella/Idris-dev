{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}

module Idris.DeepSeq(module Idris.DeepSeq, module Idris.Core.DeepSeq) where

import Idris.Core.DeepSeq
import Idris.Docstrings
import Idris.Core.TT
import Idris.AbsSyntaxTree

import Control.DeepSeq

import qualified Cheapskate.Types as CT
import qualified Idris.Docstrings as D

instance NFData a => NFData (D.Docstring a) where
  rnf (D.DocString opts contents) = rnf opts `seq` rnf contents `seq` ()

instance NFData CT.Options where
  rnf (CT.Options x1 x2 x3 x4) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` ()

instance NFData a => NFData (D.Block a) where
  rnf (D.Para lines) = rnf lines `seq` ()
  rnf (D.Header i lines) = rnf i `seq` rnf lines `seq` ()
  rnf (D.Blockquote bs) = rnf bs `seq` ()
  rnf (D.List b t xs) = rnf b `seq` rnf t `seq` rnf xs `seq` ()
  rnf (D.CodeBlock attr txt tm) = rnf attr `seq` rnf txt `seq` ()
  rnf (D.HtmlBlock txt) = rnf txt `seq` ()
  rnf D.HRule = ()

instance NFData a => NFData (D.Inline a) where
  rnf (D.Str txt) = rnf txt `seq` ()
  rnf D.Space = ()
  rnf D.SoftBreak = ()
  rnf D.LineBreak = ()
  rnf (D.Emph xs) = rnf xs `seq` ()
  rnf (D.Strong xs) = rnf xs `seq` ()
  rnf (D.Code xs tm) = rnf xs `seq` rnf tm `seq` ()
  rnf (D.Link a b xs) = rnf a `seq` rnf b `seq` rnf xs `seq` ()
  rnf (D.Image a b c) = rnf a `seq` rnf b `seq` rnf c `seq` ()
  rnf (D.Entity a) = rnf a `seq` ()
  rnf (D.RawHtml x) = rnf x `seq` ()

instance NFData CT.ListType where
  rnf (CT.Bullet c) = rnf c `seq` ()
  rnf (CT.Numbered nw i) = rnf nw `seq` rnf i `seq` ()

instance NFData CT.CodeAttr where
  rnf (CT.CodeAttr a b) = rnf a `seq` rnf b `seq` ()

instance NFData CT.NumWrapper where
  rnf CT.PeriodFollowing = ()
  rnf CT.ParenFollowing = ()

instance NFData DocTerm where
        rnf Unchecked = ()
        rnf (Checked x1) = rnf x1 `seq` ()
        rnf (Example x1) = rnf x1 `seq` ()
        rnf (Failing x1) = rnf x1 `seq` ()

-- All generated by 'derive'

instance NFData SizeChange where
        rnf Smaller = ()
        rnf Same = ()
        rnf Bigger = ()
        rnf Unknown = ()

instance NFData FnInfo where
        rnf (FnInfo x1) = rnf x1 `seq` ()

instance NFData Codegen where
        rnf (Via x1) = rnf x1 `seq` ()
        rnf Bytecode = ()

instance NFData CGInfo where
        rnf (CGInfo x1 x2 x3 x4 x5)
          = rnf x1 `seq`
              rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` rnf x5 `seq` ()

instance NFData Fixity where
        rnf (Infixl x1) = rnf x1 `seq` ()
        rnf (Infixr x1) = rnf x1 `seq` ()
        rnf (InfixN x1) = rnf x1 `seq` ()
        rnf (PrefixN x1) = rnf x1 `seq` ()

instance NFData FixDecl where
        rnf (Fix x1 x2) = rnf x1 `seq` rnf x2 `seq` ()

instance NFData Static where
        rnf Static = ()
        rnf Dynamic = ()

instance NFData ArgOpt where
        rnf _ = ()

instance NFData Plicity where
        rnf (Imp x1 x2 x3 x4)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` ()
        rnf (Exp x1 x2 x3)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()
        rnf (Constraint x1 x2)
          = rnf x1 `seq` rnf x2 `seq` ()
        rnf (TacImp x1 x2 x3)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()

instance NFData FnOpt where
        rnf Inlinable = ()
        rnf TotalFn = ()
        rnf PartialFn = ()
        rnf CoveringFn = ()
        rnf Coinductive = ()
        rnf AssertTotal = ()
        rnf Dictionary = ()
        rnf Implicit = ()
        rnf NoImplicit = ()
        rnf (CExport x1) = rnf x1 `seq` ()
        rnf ErrorHandler = ()
        rnf ErrorReverse = ()
        rnf Reflection = ()
        rnf (Specialise x1) = rnf x1 `seq` ()
        rnf Constructor = ()
        rnf AutoHint = ()
        rnf PEGenerated = ()

instance NFData DataOpt where
        rnf Codata = ()
        rnf DefaultEliminator = ()
        rnf DefaultCaseFun = ()
        rnf DataErrRev = ()

instance (NFData t) => NFData (PDecl' t) where
        rnf (PFix x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()
        rnf (PTy x1 x2 x3 x4 x5 x6 x7 x8)
          = rnf x1 `seq`
              rnf x2 `seq`
                rnf x3 `seq`
                  rnf x4 `seq`
                    rnf x5 `seq` rnf x6 `seq` rnf x7 `seq` rnf x8 `seq` ()
        rnf (PPostulate x1 x2 x3 x4 x5 x6 x7 x8)
          = rnf x1 `seq`
              rnf x2 `seq`
                rnf x3 `seq`
                  rnf x4 `seq`
                    rnf x5 `seq` rnf x6 `seq` rnf x7 `seq` rnf x8 `seq` ()
        rnf (PClauses x1 x2 x3 x4)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` ()
        rnf (PCAF x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()
        rnf (PData x1 x2 x3 x4 x5 x6)
          = rnf x1 `seq`
              rnf x2 `seq`
                rnf x3 `seq` rnf x4 `seq` rnf x5 `seq` rnf x6 `seq` ()
        rnf (PParams x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()
        rnf (PNamespace x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()
        rnf (PRecord x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12)
          = rnf x1 `seq`
              rnf x2 `seq`
                rnf x3 `seq`
                  rnf x4 `seq`
                    rnf x5 `seq`
                      rnf x6 `seq`
                        rnf x7 `seq`
                          rnf x8 `seq`
                            rnf x9 `seq`
                              rnf x10 `seq` rnf x11 `seq` rnf x12 `seq` ()
        rnf (PClass x1 x2 x3 x4 x5 x6 x8 x7 x9 x10 x11 x12)
          = rnf x1 `seq`
              rnf x2 `seq`
                rnf x3 `seq`
                  rnf x4 `seq`
                    rnf x5 `seq`
                      rnf x6 `seq`
                        rnf x7 `seq`
                          rnf x8 `seq`
                            rnf x9 `seq`
                              rnf x10 `seq`
                                rnf x11 `seq` rnf x12 `seq` ()
        rnf (PInstance x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11)
          = rnf x1 `seq`
              rnf x2 `seq`
                rnf x3 `seq`
                  rnf x4 `seq`
                    rnf x5 `seq`
                      rnf x6 `seq`
                        rnf x7 `seq`
                          rnf x8 `seq`
                            rnf x9 `seq` rnf x10 `seq` rnf x11 `seq` ()
        rnf (PDSL x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (PSyntax x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (PMutual x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (PDirective x1) = ()
        rnf (PProvider x1 x2 x3 x4 x5 x6)
          = rnf x1 `seq`
              rnf x2 `seq`
                rnf x3 `seq`
                  rnf x4 `seq`
                    rnf x5 `seq` rnf x6 `seq` ()
        rnf (PTransform x1 x2 x3 x4)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` ()
        rnf (PRunElabDecl x1 x2 x3)
          = rnf x1 `seq` rnf x2 `seq` x3 `seq` ()

instance NFData t => NFData (ProvideWhat' t)  where
        rnf (ProvTerm ty tm)   = rnf ty `seq` rnf tm `seq` ()
        rnf (ProvPostulate tm) = rnf tm `seq` ()

instance NFData PunInfo where
        rnf x = x `seq` ()

instance (NFData t) => NFData (PClause' t) where
        rnf (PClause x1 x2 x3 x4 x5 x6)
          = rnf x1 `seq`
              rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` rnf x5 `seq` rnf x6 `seq` ()
        rnf (PWith x1 x2 x3 x4 x5 x6 x7)
          = rnf x1 `seq`
              rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` rnf x5 `seq` rnf x6 `seq` rnf x7 `seq` ()
        rnf (PClauseR x1 x2 x3 x4)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` ()
        rnf (PWithR x1 x2 x3 x4 x5)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` rnf x5 `seq` ()

instance (NFData t) => NFData (PData' t) where
        rnf (PDatadecl x1 x2 x3 x4)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` ()
        rnf (PLaterdecl x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()

instance NFData PTerm where
        rnf (PQuote x1) = rnf x1 `seq` ()
        rnf (PRef x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` x3 `seq` ()
        rnf (PInferRef x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` x3 `seq` ()
        rnf (PPatvar x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (PLam _ x1 x2 x3 x4) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` ()
        rnf (PPi x1 x2 x3 x4 x5)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` rnf x5 `seq` ()
        rnf (PLet _ x1 x2 x3 x4 x5)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` rnf x5 `seq` ()
        rnf (PTyped x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (PAppImpl x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (PApp x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()
        rnf (PAppBind x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()
        rnf (PMatchApp x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (PCase x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()
        rnf (PIfThenElse x1 x2 x3 x4) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` ()
        rnf (PTrue x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (PResolveTC x1) = rnf x1 `seq` ()
        rnf (PRewrite x1 x2 x3 x4)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` ()
        rnf (PPair x1 x2 x3 x4 x5) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` x5 `seq` ()
        rnf (PDPair x1 x2 x3 x4 x5 x6)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` rnf x5 `seq` x6 `seq` ()
        rnf (PAs x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()
        rnf (PAlternative x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()
        rnf (PHidden x1) = rnf x1 `seq` ()
        rnf (PType fc) = rnf fc `seq` ()
        rnf (PUniverse _) = ()
        rnf (PGoal x1 x2 x3 x4)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` ()
        rnf (PConstant x1 x2) = x1 `seq` x2 `seq` ()
        rnf Placeholder = ()
        rnf (PDoBlock x1) = rnf x1 `seq` ()
        rnf (PIdiom x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (PReturn x1) = rnf x1 `seq` ()
        rnf (PMetavar x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (PProof x1) = rnf x1 `seq` ()
        rnf (PTactics x1) = rnf x1 `seq` ()
        rnf (PElabError x1) = rnf x1 `seq` ()
        rnf PImpossible = ()
        rnf (PCoerced x1) = rnf x1 `seq` ()
        rnf (PDisamb x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (PUnifyLog x1) = rnf x1 `seq` ()
        rnf (PNoImplicits x1) = rnf x1 `seq` ()
        rnf (PQuasiquote x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (PUnquote x1) = rnf x1 `seq` ()
        rnf (PQuoteName x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (PRunElab x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()
        rnf (PConstSugar x1 x2) = rnf x1 `seq` rnf x2 `seq` ()

instance NFData PAltType where
        rnf (ExactlyOne x1) = rnf x1 `seq` ()
        rnf FirstSuccess = ()
        rnf TryImplicit = () 

instance (NFData t) => NFData (PTactic' t) where
        rnf (Intro x1) = rnf x1 `seq` ()
        rnf Intros = ()
        rnf (Focus x1) = rnf x1 `seq` ()
        rnf (Refine x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (Rewrite x1) = rnf x1 `seq` ()
        rnf DoUnify = ()
        rnf (Induction x1) = rnf x1 `seq` ()
        rnf (CaseTac x1) = rnf x1 `seq` ()
        rnf (Equiv x1) = rnf x1 `seq` ()
        rnf (Claim x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (MatchRefine x1) = rnf x1 `seq` ()
        rnf (LetTac x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (LetTacTy x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()
        rnf (Exact x1) = rnf x1 `seq` ()
        rnf Compute = ()
        rnf Trivial = ()
        rnf TCInstance = ()
        rnf (ProofSearch r r1 r2 x1 x2 x3)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()
        rnf Solve = ()
        rnf Attack = ()
        rnf ProofState = ()
        rnf ProofTerm = ()
        rnf Undo = ()
        rnf (Try x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (TSeq x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (ApplyTactic x1) = rnf x1 `seq` ()
        rnf (ByReflection x1) = rnf x1 `seq` ()
        rnf (Reflect x1) = rnf x1 `seq` ()
        rnf (Fill x1) = rnf x1 `seq` ()
        rnf (GoalType x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf Qed = ()
        rnf Abandon = ()
        rnf (TCheck x1) = rnf x1 `seq` ()
        rnf (TEval x1) = rnf x1 `seq` ()
        rnf (TDocStr x1) = x1 `seq` ()
        rnf (TSearch x1) = rnf x1 `seq` ()
        rnf Skip = ()
        rnf (TFail x1) = rnf x1 `seq` ()
        rnf SourceFC = ()
        rnf Unfocus = ()

instance (NFData t) => NFData (PDo' t) where
        rnf (DoExp x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (DoBind x1 x2 x3 x4) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` ()
        rnf (DoBindP x1 x2 x3 x4) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` ()
        rnf (DoLet x1 x2 x3 x4 x5)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` rnf x5 `seq` ()
        rnf (DoLetP x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()

instance (NFData t) => NFData (PArg' t) where
        rnf (PImp x1 x2 x3 x4 x5)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` rnf x5 `seq` ()
        rnf (PExp x1 x2 x3 x4)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` ()
        rnf (PConstraint x1 x2 x3 x4)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` ()
        rnf (PTacImplicit x1 x2 x3 x4 x5)
          = rnf x1 `seq`
              rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` rnf x5 `seq` ()

instance NFData ClassInfo where
        rnf (CI x1 x2 x3 x4 x5 x6 x7)
          = rnf x1 `seq`
              rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` rnf x5 `seq` rnf x6 `seq` rnf x7 `seq` ()

instance NFData RecordInfo where
        rnf (RI x1 x2 x3)
          = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()

instance NFData OptInfo where
        rnf (Optimise x1 x2)
          = rnf x1 `seq` rnf x2 `seq` ()

instance NFData TypeInfo where
        rnf (TI x1 x2 x3 x4 x5) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` rnf x4 `seq` rnf x5 `seq` ()

instance (NFData t) => NFData (DSL' t) where
        rnf (DSL x1 x2 x3 x4 x5 x6 x7 x8 x9 x10)
          = rnf x1 `seq`
              rnf x2 `seq`
                rnf x3 `seq`
                  rnf x4 `seq`
                    rnf x5 `seq`
                      rnf x6 `seq` rnf x7 `seq` rnf x8 `seq` rnf x9 `seq` rnf x10 `seq` ()

instance NFData SynContext where
        rnf PatternSyntax = ()
        rnf TermSyntax = ()
        rnf AnySyntax = ()

instance NFData Syntax where
        rnf (Rule x1 x2 x3) = rnf x1 `seq` rnf x2 `seq` rnf x3 `seq` ()
        rnf (DeclRule x1 x2) = rnf x1 `seq` rnf x2 `seq` ()

instance NFData SSymbol where
        rnf (Keyword x1) = rnf x1 `seq` ()
        rnf (Symbol x1) = rnf x1 `seq` ()
        rnf (Binding x1) = rnf x1 `seq` ()
        rnf (Expr x1) = rnf x1 `seq` ()
        rnf (SimpleExpr x1) = rnf x1 `seq` ()

instance NFData Using where
        rnf (UImplicit x1 x2) = rnf x1 `seq` rnf x2 `seq` ()
        rnf (UConstraint x1 x2) = rnf x1 `seq` rnf x2 `seq` ()

instance NFData SyntaxInfo where
        rnf (Syn x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12)
          = rnf x1 `seq`
              rnf x2 `seq`
                rnf x3 `seq`
                  rnf x4 `seq`
                    rnf x5 `seq`
                      rnf x6 `seq` rnf x7 `seq` rnf x8 `seq` rnf x9 `seq` rnf x10 `seq` rnf x11 `seq` rnf x12 `seq` ()
