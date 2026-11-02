.class Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;
.super Ljava/lang/Object;
.source "DIDContextMonitor.java"


# instance fields
.field private volatile canSwitchContext:Z

.field private final contextWrapper:Landroid/content/MutableContextWrapper;

.field private final defaultContext:Landroid/content/Context;

.field private volatile pendingContext:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->defaultContext:Landroid/content/Context;

    .line 20
    new-instance v0, Landroid/content/MutableContextWrapper;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->defaultContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/content/MutableContextWrapper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->contextWrapper:Landroid/content/MutableContextWrapper;

    .line 21
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->canSwitchContext:Z

    .line 22
    return-void
.end method


# virtual methods
.method allowContextSwitch()V
    .locals 2

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->canSwitchContext:Z

    if-eqz v0, :cond_1

    .line 40
    const-string v0, "PRELOAD_INFO"

    const-string v1, "Improperly calling allowContextSwitch on monitor already in that state"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    :cond_0
    :goto_0
    return-void

    .line 43
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->canSwitchContext:Z

    .line 44
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->pendingContext:Landroid/content/Context;

    if-eqz v0, :cond_2

    .line 45
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->contextWrapper:Landroid/content/MutableContextWrapper;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->pendingContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroid/content/MutableContextWrapper;->setBaseContext(Landroid/content/Context;)V

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->pendingContext:Landroid/content/Context;

    goto :goto_0

    .line 47
    :cond_2
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->contextWrapper:Landroid/content/MutableContextWrapper;

    invoke-virtual {v0}, Landroid/content/MutableContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_0

    .line 48
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->contextWrapper:Landroid/content/MutableContextWrapper;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->defaultContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroid/content/MutableContextWrapper;->setBaseContext(Landroid/content/Context;)V

    goto :goto_0
.end method

.method getCurrentContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->contextWrapper:Landroid/content/MutableContextWrapper;

    return-object v0
.end method

.method preventContextSwitch()V
    .locals 1

    .prologue
    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->canSwitchContext:Z

    .line 36
    return-void
.end method

.method updateContext(Landroid/content/Context;)V
    .locals 2
    .param p1, "newContext"    # Landroid/content/Context;

    .prologue
    .line 25
    iget-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->canSwitchContext:Z

    if-eqz v0, :cond_0

    .line 26
    const-string v0, "PRELOAD_INFO"

    const-string v1, "context was successfully switched on the main thread."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->contextWrapper:Landroid/content/MutableContextWrapper;

    invoke-virtual {v0, p1}, Landroid/content/MutableContextWrapper;->setBaseContext(Landroid/content/Context;)V

    .line 32
    :goto_0
    return-void

    .line 29
    :cond_0
    const-string v0, "PRELOAD_INFO"

    const-string v1, "we can\'t switch the context right now, so set it as a pending one for when we can"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->pendingContext:Landroid/content/Context;

    goto :goto_0
.end method
