using UnityEngine;

namespace NdiQualityTest
{
    sealed class AlphaTest : MonoBehaviour
    {
        [SerializeField] RenderTexture _input = null;

        [HideInInspector, SerializeField] Shader _shader = null;

        Material _material;

        void OnRenderImage(RenderTexture source, RenderTexture destination)
        {
            if (_material == null) _material = new Material(_shader);
            _material.SetTexture("_TestTex", _input);
            Graphics.Blit(source, destination, _material, 1);
        }
    }
}
