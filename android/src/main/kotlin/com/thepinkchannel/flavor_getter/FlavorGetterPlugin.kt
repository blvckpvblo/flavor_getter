/*
 * FlavorGetterPlugin.kt
 * Flavor Getter Plugin
 *
 * Description: A plugin to retrieve the current flavor of the Flutter application.
 * Version: 0.0.4
 * Author: Momar Talla Cisse
 * License: BSD 3-Clause
 * Created: 2023-06-18
 * Last Modified: 2025-05-15
 */

package com.thepinkchannel.flavor_getter

import androidx.annotation.NonNull
import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlavorGetterPlugin */
class FlavorGetterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var applicationContext: Context? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    applicationContext = flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flavor_getter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getFlavor") {
      try {
        val packageName = applicationContext!!.packageName
        val flavor = getFlavor(packageName)
        result.success(flavor)
      }
      catch(exception: Exception) {
        result.success(null)
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    applicationContext = null
    channel.setMethodCallHandler(null)
  }

  fun getFlavor(packageName: String): String? {
    try {
        // Try with the full package name first
        val buildConfigClassName = "$packageName.BuildConfig"
        try {
            val buildConfigClass = Class.forName(buildConfigClassName)
            val flavorField = buildConfigClass.getDeclaredField("FLAVOR")
            flavorField.isAccessible = true
            return flavorField.get(null) as? String
        } catch (e: ClassNotFoundException) {
            // If not found, try with the base package name (without flavor suffix)
            val basePackageName = packageName.substringBeforeLast(".")
            val baseBuildConfigClassName = "$basePackageName.BuildConfig"
            
            val buildConfigClass = Class.forName(baseBuildConfigClassName)
            val flavorField = buildConfigClass.getDeclaredField("FLAVOR")
            flavorField.isAccessible = true
            return flavorField.get(null) as? String
        }
    } catch (e: Exception) {
        return null
    }
  }
}