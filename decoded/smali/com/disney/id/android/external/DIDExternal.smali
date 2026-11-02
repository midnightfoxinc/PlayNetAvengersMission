.class public abstract Lcom/disney/id/android/external/DIDExternal;
.super Ljava/lang/Object;
.source "DIDExternal.java"


# static fields
.field protected static final NAMESPACE_PREFIX:Ljava/lang/String; = "AM-"


# instance fields
.field protected mCallback:Lcom/disney/id/android/external/DIDExternalCallback;

.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public check()Z
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x1

    return v0
.end method

.method public abstract getExternalData()V
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract getRequestCode()I
.end method

.method public isAvailable()Z
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x1

    return v0
.end method

.method public logout()V
    .locals 0

    .prologue
    .line 39
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 50
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 48
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 46
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 44
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 49
    return-void
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 42
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 47
    return-void
.end method

.method public setCallback(Lcom/disney/id/android/external/DIDExternalCallback;)V
    .locals 0
    .param p1, "callback"    # Lcom/disney/id/android/external/DIDExternalCallback;

    .prologue
    .line 16
    iput-object p1, p0, Lcom/disney/id/android/external/DIDExternal;->mCallback:Lcom/disney/id/android/external/DIDExternalCallback;

    .line 17
    return-void
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    iput-object p1, p0, Lcom/disney/id/android/external/DIDExternal;->mContext:Landroid/content/Context;

    .line 21
    return-void
.end method
