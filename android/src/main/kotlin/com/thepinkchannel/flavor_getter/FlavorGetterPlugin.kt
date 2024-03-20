/*
 * FlavorGetterPlugin.kt
 * Flavor Getter Plugin
 *
 * Description: A plugin to retrieve the current flavor of the Flutter application.
 * Version: 0.0.3
 * Author: Momar Talla Cisse
 * License: BSD 3-Clause
 * Created: 2023-06-18
 * Last Modified: 2023-06-22
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
        val flavor = getFlavor(applicationContext!!.packageName)

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

  fun getFlavor(fieldName: String): Any? {
    var packageName = fieldName

    try {
        val myClass = Class.forName("${packageName}.BuildConfig")
        val fieldObj = myClass.getField("FLAVOR")

        return fieldObj.get(null)
    } catch (e: ClassNotFoundException) {
        // Field retrieval failed, try removing the last segment of the package name
        val lastDotIndex = packageName.lastIndexOf('.')
        
        if (lastDotIndex != -1) {
            packageName = packageName.substring(0, lastDotIndex)

            return getFlavor(packageName)
        }
    } catch (e: NoSuchFieldException) {
        // Field not found, handle accordingly
        return null
    } catch (e: IllegalAccessException) {
        // Access to field failed, handle accordingly
        return null
    }

    return null
}

}