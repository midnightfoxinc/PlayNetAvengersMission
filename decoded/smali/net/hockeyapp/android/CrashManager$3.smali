.class Lnet/hockeyapp/android/CrashManager$3;
.super Ljava/lang/Thread;
.source "CrashManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/hockeyapp/android/CrashManager;->sendCrashes(Ljava/lang/ref/WeakReference;Lnet/hockeyapp/android/CrashManagerListener;Z)V
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
    iput-object p1, p0, Lnet/hockeyapp/android/CrashManager$3;->val$weakContext:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lnet/hockeyapp/android/CrashManager$3;->val$listener:Lnet/hockeyapp/android/CrashManagerListener;

    iput-boolean p3, p0, Lnet/hockeyapp/android/CrashManager$3;->val$ignoreDefaultHandler:Z

    .line 392
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 395
    iget-object v0, p0, Lnet/hockeyapp/android/CrashManager$3;->val$weakContext:Ljava/lang/ref/WeakReference;

    iget-object v1, p0, Lnet/hockeyapp/android/CrashManager$3;->val$listener:Lnet/hockeyapp/android/CrashManagerListener;

    invoke-static {v0, v1}, Lnet/hockeyapp/android/CrashManager;->submitStackTraces(Ljava/lang/ref/WeakReference;Lnet/hockeyapp/android/CrashManagerListener;)V

    .line 396
    iget-object v0, p0, Lnet/hockeyapp/android/CrashManager$3;->val$weakContext:Ljava/lang/ref/WeakReference;

    iget-object v1, p0, Lnet/hockeyapp/android/CrashManager$3;->val$listener:Lnet/hockeyapp/android/CrashManagerListener;

    iget-boolean v2, p0, Lnet/hockeyapp/android/CrashManager$3;->val$ignoreDefaultHandler:Z

    invoke-static {v0, v1, v2}, Lnet/hockeyapp/android/CrashManager;->access$0(Ljava/lang/ref/WeakReference;Lnet/hockeyapp/android/CrashManagerListener;Z)V

    .line 397
    return-void
.end method
