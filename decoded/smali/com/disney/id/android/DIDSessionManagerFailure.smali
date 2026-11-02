.class public abstract Lcom/disney/id/android/DIDSessionManagerFailure;
.super Ljava/lang/RuntimeException;
.source "DIDSessionManagerFailure.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getFailureInformation()Lorg/json/JSONObject;
.end method

.method public abstract getLocalizedMessage()Ljava/lang/String;
.end method

.method public abstract isForcedLogout()Z
.end method
