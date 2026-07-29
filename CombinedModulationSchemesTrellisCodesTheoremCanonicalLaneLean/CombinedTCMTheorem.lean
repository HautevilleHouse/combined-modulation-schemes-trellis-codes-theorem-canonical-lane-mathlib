import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure CombinedTCMTheorem where
  signalSpace : ModulationSignalSpace
  trellis : TrellisStateTransition
  encoder : ConvolutionalEncoder
  decoder : ViterbiDecoder
  scheme : ModulationScheme
  combinedCodingGain : Prop
  asymptoticTightness : Prop

structure CombinedTCMEvidence (T : CombinedTCMTheorem) where
  signalSpaceClosed : ModulationSignalClosed T.signalSpace
  trellisClosed : TrellisStateClosed T.trellis
  encoderClosed : ConvolutionalEncoderClosed T.encoder
  decoderClosed : ViterbiDecoderClosed T.decoder
  schemeClosed : ModulationSchemeClosed T.scheme
  combinedCodingGainClosed : T.combinedCodingGain
  asymptoticTightnessClosed : T.asymptoticTightness

def CombinedTCMClosed (T : CombinedTCMTheorem) : Prop :=
  ModulationSignalClosed T.signalSpace ∧
  TrellisStateClosed T.trellis ∧
  ConvolutionalEncoderClosed T.encoder ∧
  ViterbiDecoderClosed T.decoder ∧
  ModulationSchemeClosed T.scheme ∧
  T.combinedCodingGain ∧
  T.asymptoticTightness

theorem combined_tcm_closed_from_evidence (T : CombinedTCMTheorem)
    (E : CombinedTCMEvidence T) : CombinedTCMClosed T := by
  exact And.intro E.signalSpaceClosed
    (And.intro E.trellisClosed
      (And.intro E.encoderClosed
        (And.intro E.decoderClosed
          (And.intro E.schemeClosed
            (And.intro E.combinedCodingGainClosed
              E.asymptoticTightnessClosed)))))

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse