.class Lcom/disney/id/android/ImprovedDIDSessionManager$ImprovedDIDSessionManagerLoader;
.super Ljava/lang/Object;
.source "ImprovedDIDSessionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/ImprovedDIDSessionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ImprovedDIDSessionManagerLoader"
.end annotation


# static fields
.field private static final LOADER:Lcom/disney/id/android/ImprovedDIDSessionManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 477
    new-instance v0, Lcom/disney/id/android/ImprovedDIDSessionManager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/disney/id/android/ImprovedDIDSessionManager;-><init>(Lcom/disney/id/android/ImprovedDIDSessionManager$1;)V

    sput-object v0, Lcom/disney/id/android/ImprovedDIDSessionManager$ImprovedDIDSessionManagerLoader;->LOADER:Lcom/disney/id/android/ImprovedDIDSessionManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 476
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100()Lcom/disney/id/android/ImprovedDIDSessionManager;
    .locals 1

    .prologue
    .line 476
    sget-object v0, Lcom/disney/id/android/ImprovedDIDSessionManager$ImprovedDIDSessionManagerLoader;->LOADER:Lcom/disney/id/android/ImprovedDIDSessionManager;

    return-object v0
.end method
