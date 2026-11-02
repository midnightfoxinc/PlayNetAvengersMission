.class Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle$DIDLightBoxInteractionFatoryLoader;
.super Ljava/lang/Object;
.source "DIDLightBoxInteractionLifecycle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DIDLightBoxInteractionFatoryLoader"
.end annotation


# static fields
.field static final LOADER:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 64
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;-><init>(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle$1;)V

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle$DIDLightBoxInteractionFatoryLoader;->LOADER:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
