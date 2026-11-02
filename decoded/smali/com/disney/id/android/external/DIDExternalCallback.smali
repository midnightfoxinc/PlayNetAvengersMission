.class public Lcom/disney/id/android/external/DIDExternalCallback;
.super Ljava/lang/Object;
.source "DIDExternalCallback.java"

# interfaces
.implements Lcom/disney/id/android/external/DIDExternalInterface;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 0

    .prologue
    .line 11
    return-void
.end method

.method public onError(Lcom/disney/id/android/DIDException;)V
    .locals 0
    .param p1, "error"    # Lcom/disney/id/android/DIDException;

    .prologue
    .line 14
    return-void
.end method

.method public onExternalData(Lcom/disney/id/android/external/DIDExternalData;)V
    .locals 0
    .param p1, "externalData"    # Lcom/disney/id/android/external/DIDExternalData;

    .prologue
    .line 8
    return-void
.end method
