.class public Lcom/kochava/android/tracker/lite/Global;
.super Ljava/lang/Object;
.source "Global.java"


# static fields
.field protected static DEBUGERROR:Z = false

.field protected static final SDK_VERSION:Ljava/lang/String; = "AndroidLite20150310"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 6
    const/4 v0, 0x1

    sput-boolean v0, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
