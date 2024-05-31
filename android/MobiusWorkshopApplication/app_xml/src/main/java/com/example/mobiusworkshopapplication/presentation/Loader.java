package com.example.mobiusworkshopapplication.presentation;

import static com.example.mobiusworkshopapplication.presentation.PresentationExtKt.getColorAttr;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;

import androidx.annotation.ColorInt;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.content.res.AppCompatResources;

import com.example.mobiusworkshopapplication.R;

import kotlin.Deprecated;


@Deprecated(message = "Устарело, используем EatsSpinner")
public class Loader extends View implements ValueAnimator.AnimatorUpdateListener {

    private Drawable loader;
    private int turnDuration;
    private float degree;
    private ValueAnimator loaderAnimator;

    private Type type = Type.SPINNER;
    private float animatedFraction;

    public Loader(Context context) {
        super(context);
        init(null, 0);
    }

    public Loader(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        init(attrs, 0);
    }

    public Loader(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(attrs, defStyleAttr);
    }

    private void init(AttributeSet attrs, int defStyle) {
        final TypedArray a = getContext().obtainStyledAttributes(attrs, R.styleable.Loader, defStyle, 0);
        int color;
        if (a.hasValue(R.styleable.Loader_loaderColor)) {
            color = a.getColor(R.styleable.Loader_loaderColor, Color.BLACK);
        } else {
            color = getColorAttr(getContext(), R.color.bg_invert, Color.BLACK);
        }
        turnDuration = a.getInt(R.styleable.Loader_loaderDuration, 3000);
        type = Type.values()[a.getInt(R.styleable.Loader_loaderType, 0)];

        loader = a.getDrawable(R.styleable.Loader_loaderDrawable);
        if (loader != null) {
            loader.setColorFilter(color, PorterDuff.Mode.SRC_ATOP);
        } else {
            loader = AppCompatResources.getDrawable(getContext(), R.drawable.ic_preloader_24);
        }
        loader.setAlpha(0xFF);
        loader = loader.mutate();
        setAlpha(1);
        a.recycle();
        loaderAnimator = ValueAnimator.ofFloat(0, 3160);
        loaderAnimator.setDuration(turnDuration);
        loaderAnimator.setRepeatMode(ValueAnimator.REVERSE);
        loaderAnimator.setRepeatCount(ValueAnimator.INFINITE);
        loaderAnimator.setInterpolator(new AccelerateDecelerateInterpolator());
        if (getVisibility() == VISIBLE) {
            loaderAnimator.start();
        }
        setBackground(loader);
    }

    @Override
    protected void onAttachedToWindow() {
        loaderAnimator.removeUpdateListener(this);
        loaderAnimator.addUpdateListener(this);
        super.onAttachedToWindow();
    }

    @Override
    protected void onDetachedFromWindow() {
        loaderAnimator.removeUpdateListener(this);
        super.onDetachedFromWindow();
    }

    @Override
    public void onAnimationUpdate(ValueAnimator animation) {
        animatedFraction = animation.getAnimatedFraction();
        switch (type) {
            case SPINNER:
                degree = (float) animation.getAnimatedValue();
                setRotation(degree);
                break;
            case FADER:
                setAlpha(animatedFraction);
                break;
        }
    }

    public void show() {
        fade(true);
    }

    public void hide() {
        fade(false);
    }

    private void fade(boolean show) {
        setVisibility(show ? VISIBLE : GONE);
    }

    @Override
    public void setVisibility(int visibility) {
        super.setVisibility(visibility);
        if (visibility == GONE || visibility == INVISIBLE) {
            loaderAnimator.end();
        } else {
            loaderAnimator.start();
        }
    }

    public void setLoaderColor(@ColorInt int color) {
        loader.setColorFilter(color, PorterDuff.Mode.SRC_ATOP);
    }

    public void stop() {
        loaderAnimator.cancel();
    }

    public void start() {
        loaderAnimator.start();
    }

    public void setLoaderDrawable(@NonNull Drawable loaderDrawable) {
        loader = loaderDrawable.mutate();
        loader.setAlpha(0xFF);
        setBackground(loader);
    }

    public enum Type {
        SPINNER,
        FADER
    }
}
