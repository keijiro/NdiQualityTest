using UnityEngine;

namespace NdiQualityTest
{
    sealed class AlphaPattern : MonoBehaviour
    {
        [HideInInspector, SerializeField] Shader _shader = null;

        Material _material;

        void OnRenderImage(RenderTexture source, RenderTexture destination)
        {
            if (_material == null) _material = new Material(_shader);
            Graphics.Blit(source, destination, _material, 0);
        }
    }
}
