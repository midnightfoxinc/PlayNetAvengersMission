.class Lcom/disney/id/android/DIDSession$2;
.super Ljava/lang/Object;
.source "DIDSession.java"

# interfaces
.implements Lcom/disney/id/android/DIDForeground$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/DIDSession;-><init>(Landroid/content/Context;Lcom/disney/id/android/DIDSessionDelegate;Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDSession;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDSession;)V
    .locals 0

    .prologue
    .line 84
    iput-object p1, p0, Lcom/disney/id/android/DIDSession$2;->this$0:Lcom/disney/id/android/DIDSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBecameBackground()V
    .locals 2

    .prologue
    .line 93
    const-string v0, "PRELOAD_INFO"

    const-string v1, "The app went into the background."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    return-void
.end method

.method public onBecameForeground()V
    .locals 2

    .prologue
    .line 87
    const-string v0, "PRELOAD_INFO"

    const-string v1, "The app became foreground, try a refresh of LBI."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getInstance()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->refreshCache()V

    .line 89
    return-void
.end method
