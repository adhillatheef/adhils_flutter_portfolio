//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import native_pdf_renderer
import path_provider_foundation
import pdf_render
import url_launcher_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  NativePdfRendererPlugin.register(with: registry.registrar(forPlugin: "NativePdfRendererPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SwiftPdfRenderPlugin.register(with: registry.registrar(forPlugin: "SwiftPdfRenderPlugin"))
  UrlLauncherPlugin.register(with: registry.registrar(forPlugin: "UrlLauncherPlugin"))
}
