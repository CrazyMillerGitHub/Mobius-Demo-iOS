package com.example.mobiusworkshopapplication.presentation

import android.content.Context
import android.util.TypedValue
import androidx.annotation.AttrRes
import androidx.annotation.ColorInt

@ColorInt
internal fun Context.getColorAttr(@AttrRes attrId: Int, @ColorInt defaultValue: Int = 0): Int {
    val typedValue = TypedValue()
    theme.resolveAttribute(attrId, typedValue, true)
    return when (typedValue.type) {
        TypedValue.TYPE_INT_COLOR_ARGB8,
        TypedValue.TYPE_INT_COLOR_ARGB4,
        TypedValue.TYPE_INT_COLOR_RGB4,
        TypedValue.TYPE_INT_COLOR_RGB8,
        -> typedValue.data
        else -> defaultValue
    }
}