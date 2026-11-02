.class Lcom/disney/id/android/InternalImprovedDIDSessionManager$InternalImprovedDIDSessionManagerLoader;
.super Ljava/lang/Object;
.source "InternalImprovedDIDSessionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/InternalImprovedDIDSessionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InternalImprovedDIDSessionManagerLoader"
.end annotation


# static fields
.field private static final LOADER:Lcom/disney/id/android/InternalImprovedDIDSessionManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 86
    new-instance v0, Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;-><init>(Lcom/disney/id/android/InternalImprovedDIDSessionManager$1;)V

    sput-object v0, Lcom/disney/id/android/InternalImprovedDIDSessionManager$InternalImprovedDIDSessionManagerLoader;->LOADER:Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/disney/id/android/InternalImprovedDIDSessionManager;
    .locals 1

    .prologue
    .line 85
    sget-object v0, Lcom/disney/id/android/InternalImprovedDIDSessionManager$InternalImprovedDIDSessionManagerLoader;->LOADER:Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    return-object v0
.end method
