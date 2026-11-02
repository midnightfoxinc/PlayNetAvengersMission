.class Lnet/hockeyapp/android/CrashManager$2;
.super Ljava/lang/Object;
.source "CrashManager.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/hockeyapp/android/CrashManager;->showDialog(Ljava/lang/ref/WeakReference;Lnet/hockeyapp/android/CrashManagerListener;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$ignoreDefaultHandler:Z

.field private final synthetic val$listener:Lnet/hockeyapp/android/CrashManagerListener;

.field private final synthetic val$weakContext:Ljava/lang/ref/WeakReference;


# direct methods
.method constructor <init>(Ljava/lang/ref/WeakReference;Lnet/hockeyapp/android/CrashManagerListener;Z)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lnet/hockeyapp/android/CrashManager$2;->val$weakContext:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lnet/hockeyapp/android/CrashManager$2;->val$listener:Lnet/hockeyapp/android/CrashManagerListener;

    iput-boolean p3, p0, Lnet/hockeyapp/android/CrashManager$2;->val$ignoreDefaultHandler:Z

    .line 376
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 378
    iget-object v0, p0, Lnet/hockeyapp/android/CrashManager$2;->val$weakContext:Ljava/lang/ref/WeakReference;

    iget-object v1, p0, Lnet/hockeyapp/android/CrashManager$2;->val$listener:Lnet/hockeyapp/android/CrashManagerListener;

    iget-boolean v2, p0, Lnet/hockeyapp/android/CrashManager$2;->val$ignoreDefaultHandler:Z

    invoke-static {v0, v1, v2}, Lnet/hockeyapp/android/CrashManager;->access$1(Ljava/lang/ref/WeakReference;Lnet/hockeyapp/android/CrashManagerListener;Z)V

    .line 379
    return-void
.end method
